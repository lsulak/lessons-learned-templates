# Makefile for Python development
# You need: docker, black, coala, flake8, pylint,
# mdl (installable via gem), and coverage.

black:
	black --line-length 79 .

black-ci:
	echo -e "\n# Diff for each file:"; \
	black --line-length 79 --diff .; \
	echo -e "\n# Status:"; \
	black --line-length 79 --check .

coala:
	sudo docker run -ti --rm -v $$(pwd):/app:Z --workdir=/app coala/base coala

flake8:
	flake8

PYLINT_FILES = `find . \
		-path './docs' -prune -o \
		-name '*.py' -print`; \

pylint:
	python3 -m pylint $(PYLINT_FILES)

pylint-shorter:
	python3 -m pylint --disable=I --enable=useless-suppression $(PYLINT_FILES)

readme-lint:
	mdl README.md

lint: black-ci coala flake8 pylint-shorter readme-lint

unit-tests:
	coverage3 erase
	coverage3 run -m pytest -rxXs \
		tests/unit
	coverage3 report
	coverage3 html

integration-tests:
	coverage3 run -a -m pytest -rxXs \
		tests/integration
	coverage3 report
	coverage3 html

test: lint unit-tests integration-tests

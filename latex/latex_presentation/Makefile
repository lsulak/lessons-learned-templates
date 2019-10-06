#===========================
# Author: Ladislav Sulak
#===========================

NAME=slides

all: $(NAME).pdf

pdf: $(NAME).pdf

$(NAME).ps: $(NAME).dvi
	%dvips $(NAME) > compilation.log

$(NAME).pdf: clean
	pdflatex $(NAME) > compilation.log
	bibtex $(NAME)   > compilation.log
	pdflatex $(NAME) > compilation.log
	pdflatex $(NAME) > compilation.log

$(NAME).dvi: $(NAME).tex $(NAME).bib
	latex $(NAME)  > compilation.log
	bibtex $(NAME) > compilation.log
	latex $(NAME)  > compilation.log
	latex $(NAME)  > compilation.log

clean:
	rm -f *.dvi *.nav *.snm *.gz *.log $(NAME).blg $(NAME).bbl $(NAME).toc *.aux $(NAME).out $(NAME).lof
	rm -f $(NAME).tar.gz
	rm -f *~

pack: clean
	tar czvf $(NAME).tar.gz *.tex *.bib ./fig/* $(NAME).pdf Makefile

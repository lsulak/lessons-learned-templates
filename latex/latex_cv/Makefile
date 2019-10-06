#===========================
# Author: Ladislav Sulak
#===========================
NAME=lsulak_resume

xelatex:
	for f in *.tex; do xelatex $$f; done

clean:
	rm -f *.dvi *.nav *.snm *.gz log *.blg *.bbl *.toc *.aux *.out *.lof
	rm -f $(NAME).tar.gz
	rm -f *~

pack: clean
	tar czvf $(NAME).tar.gz *.cls *.sty *.tex fonts/* resume/*.tex *.pdf Makefile

all: clean xelatex

PAPER=lecture-notes

$(PAPER).pdf:
	latexmk -pdf \
		-latexoption=-file-line-error \
		-latexoption=-shell-escape\
		-latexoption=-halt-on-error\
		-latexoption=-interaction=nonstopmode \
		-latexoption=-synctex=1 $(PAPER)
.PHONY: $(PAPER).pdf 


henry:
	latexmk -pdf -pvc \
		-latexoption=-file-line-error \
		-latexoption=-shell-escape\
		-latexoption=-halt-on-error\
		-latexoption=-interaction=nonstopmode \
		-latexoption=-synctex=1 $(PAPER)

clean:
	latexmk -C $(PAPER).tex
	rm -f lecture-notes.bbl
.PHONY: clean

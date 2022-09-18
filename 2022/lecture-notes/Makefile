
PAPER=lecture-notes

$(PAPER).pdf:
	  latexmk -pdf -pvc \
    -latexoption=-file-line-error \
    -latexoption=-shell-escape\
    -latexoption=-halt-on-error\
    -latexoption=-interaction=nonstopmode \
    -latexoption=-synctex=1 $(PAPER)
.PHONY: $(PAPER).pdf 

#		-latexoption=-interaction=nonstopmode \
.PHONY: clean
clean:
	latexmk -C $(PAPER).tex

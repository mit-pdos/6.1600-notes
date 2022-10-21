PAPER=lecture-notes

$(PAPER).pdf:
	latexmk -pdf \
		-latexoption=-file-line-error \
		-latexoption=-shell-escape\
		-latexoption=-halt-on-error\
		-latexoption=-interaction=nonstopmode \
		-latexoption=-synctex=1 $(PAPER)
.PHONY: $(PAPER).pdf 

IN = $(wildcard lectures/lec*.tex)
OUT = $(subst lectures/,build/,$(IN))
OUT2 = $(addsuffix .pdf,$(basename $(OUT)))

.PHONY: build/%.pdf.run

build/%.pdf: lectures/%.tex
	mkdir -p build
	$(eval ARGS := -output-directory=build -jobname=$(basename $(notdir $@)) \
		"\input{chapter}\input{$<}\bibliography{ref}\end{document}")
	pdflatex $(ARGS)
	pdflatex $(ARGS)
	cp ref.bib build/ref.bbl
	bibtex build/$(basename $(notdir $@))
	pdflatex $(ARGS)

default: $(OUT2)

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

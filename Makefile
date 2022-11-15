PAPER=lecture-notes

$(PAPER).pdf:
	./latexrun/latexrun --bibtex-cmd biber $(PAPER).tex
.PHONY: $(PAPER).pdf 

IN = $(wildcard lectures/lec*.tex)
OUT = $(subst lectures/,chapters/,$(IN))
OUT2 = $(addsuffix .pdf,$(basename $(OUT)))

.PHONY: chapters/%.pdf.run

chapters/%.pdf: lectures/%.tex
	mkdir -p build
	mkdir -p chapters
	cp ref.bib build/ref.bib
	# creates a temporary file from the _chapter.tex template that we then compile
	sed s:CHAPTER.TEX:$<: <_chapter.tex >build/$*_standalone.tex 
	./latexrun/latexrun -o chapters/$*.pdf --bibtex-cmd biber build/$*_standalone.tex

henry:
	latexmk -pdf -pvc \
		-latexoption=-file-line-error \
		-latexoption=-shell-escape\
		-latexoption=-halt-on-error\
		-latexoption=-interaction=nonstopmode \
		-latexoption=-synctex=1 $(PAPER)

all: $(PAPER).pdf $(OUT2)

clean:
	./latexrun/latexrun --clean-all
	rm -f lecture-notes.bbl build/* chapters/*
.PHONY: clean

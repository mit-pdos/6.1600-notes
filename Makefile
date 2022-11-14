PAPER=lecture-notes

$(PAPER).pdf:
	./latexrun/latexrun $(PAPER).tex
.PHONY: $(PAPER).pdf 

IN = $(wildcard lectures/lec*.tex)
OUT = $(subst lectures/,build/,$(IN))
OUT2 = $(addsuffix .pdf,$(basename $(OUT)))

.PHONY: build/%.pdf.run

chapters/%.pdf: lectures/%.tex
	mkdir -p build
	mkdir -p chapters
	# creates a temporary file from the _chapter.tex template that we then compile
	sed s:CHAPTER.TEX:$<: <_chapter.tex >build/$*_standalone.tex 
	./latexrun/latexrun -o chapters/$*.pdf build/$*_standalone.tex

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
	rm -f lecture-notes.bbl build/*
.PHONY: clean

# Makefile for the scientific article in project-template

all: output/article_text.docx output/article_text.pdf output/table.pdf output/figures.pdf  output/full_article.pdf

output/article_text.docx: article_text.md refs.bib
	pandoc -H format.sty -V fontsize=12pt --bibliography refs.bib --csl=ecology.csl article_text.md -o output/article_text.docx

output/article_text.pdf: article_text.md refs.bib
	# reset the starting page to 1 
	./rwstyle 1 > format.sty

	pandoc -H format.sty -V fontsize=12pt --bibliography refs.bib --csl=ecology.csl article_text.md -o output/article_text.pdf

output/table.pdf: analysis/analysis.R analysis/iris.csv
	# run analysis
	R --slave --vanilla < analysis/analysis.R
	
	# alter start page
	./rwstyle $(shell ./nextpage output/article_text.pdf) > format.sty
	
	# make the pdf
	pandoc -H format.sty -V fontsize=12pt analysis/table.md -o output/table.pdf
	
	# make temporary pdf that merges text with table
	gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=temp.pdf output/article_text.pdf output/table.pdf

output/figures.pdf: analysis/analysis.R analysis/iris.csv
	# alter start page
	./rwstyle $(shell ./nextpage temp.pdf) > format.sty
	rm temp.pdf

	# make pdf of figures
	pandoc -H format.sty -V fontsize=12pt analysis/figures.md -o output/figures.pdf

output/full_article.pdf: article_text.md refs.bib analysis/analysis.R
	# merge pdfs
	gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=output/full_article.pdf output/article_text.pdf output/table.pdf output/figures.pdf
	
	# reset the starting page to 1 
	./rwstyle 1 > format.sty

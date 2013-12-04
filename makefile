all: output/figures.pdf output/table.pdf output/article_text.pdf output/article_text.docx output/full_article.pdf

output/figures.pdf: analysis/analysis.R analysis/iris.csv
	R --slave --vanilla < analysis/analysis.R
	pandoc -H format.sty -V fontsize=12pt analysis/figures.md -o output/figures.pdf

output/table.pdf: analysis/analysis.R analysis/iris.csv
	pandoc -H format.sty -V fontsize=12pt analysis/table.md -o output/table.pdf

output/article_text.docx: article_text.md refs.bib
	pandoc -H format.sty -V fontsize=12pt --bibliography refs.bib --csl=ecology.csl article_text.md -o output/article_text.docx

output/article_text.pdf: article_text.md refs.bib
	pandoc -H format.sty -V fontsize=12pt --bibliography refs.bib --csl=ecology.csl article_text.md -o output/article_text.pdf

output/full_article.pdf: article_text.md refs.bib analysis/analysis.R
	gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=output/full_article.pdf output/article_text.pdf output/table.pdf output/figures.pdf

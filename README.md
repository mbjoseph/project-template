Academic journal article template
===========================================

## Description
This is a [markdown](http://daringfireball.net/projects/markdown/) 
template for an academic article that is based on the code used 
to make the data sharing article published in the IEE special issue by 
[White et al. (2013)](https://peerj.com/preprints/7v2.pdf‎), 
and was cloned then altered from the github 
[repo](https://github.com/weecology/data-sharing-paper) 
for that article. My goal here is to avoid having to go back and forth
between R, MS Word, and some reference management utility to create an 
article. The main body is written in markdown format, which is then 
converted to whatever format you want (currently .pdf and .doc) using 
[pandoc](http://johnmacfarlane.net/pandoc/).

With this setup, any changes to the R file propagate 
to figures and results tables, and these changes are 
automatically incorporated in the final document (in pdf form). Tweaks 
can be made to export to other formats like LaTeX etc. 

To make the article:
```
git clone git://github.com/mbjoseph/project-template.git
cd project-template
make
```

### Citation formatting
The current citation format follows Ecology's guidelines, but more formats
(covering most journals) are available on github:

```
git clone git://github.com/citation-style-language/styles.git
```

More info on citations and some other good information can be found on 
the scholarly markdown  
[wiki](https://github.com/scholmd/scholmd/wiki/citations).

You'll need a .bib file that contains the BibTeX citation info for any 
articles that are cited. Most reference management software 
(e.g. [Mendeley](http://www.mendeley.com/), [Zotero](http://www.mendeley.com/), 
[EndNote](http://endnote.com/)) can export a .bib file.

### Dependencies
[pandoc](http://johnmacfarlane.net/pandoc/installing.html), [xpdf](http://www.foolabs.com/xpdf/), [R](http://www.r-project.org/)

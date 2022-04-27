ZIPNAME=Kasper-TE20-The-Indie-Quest.zip
ZIPFOLDER=zip
PROJFILE=Project
ORGNAME=$(PROJFILE).org
MDNAME=$(PROJFILE).md
ODTNAME=$(PROJFILE).odt
PDFNAME=$(PROJFILE).pdf
IMPORTANTFILES=assets sketch # *.html

zip: $(ZIPNAME)

$(ZIPNAME): $(IMPORTANTFILES) $(ORGNAME) Makefile
	-rm $(ZIPNAME)
	-mkdir -pv $(ZIPFOLDER)
	cp -r $(IMPORTANTFILES) $(ZIPFOLDER)
	emacs --batch --eval "(require 'org)" \
		--eval "(require 'ox-md)" --eval "(require 'ox-odt)" \
		--eval "(setq org-export-with-toc nil org-export-with-section-numbers nil)" \
		--eval '(find-file "Project.org")' \
		--eval '(org-md-export-to-markdown)' --eval '(org-odt-export-to-odt)'
	mv $(ODTNAME) $(MDNAME) $(ZIPFOLDER)/
	cd $(ZIPFOLDER) && soffice --convert-to pdf $(ODTNAME)
	rm zip/$(ODTNAME)
	cd $(ZIPFOLDER) && zip -r ../$(ZIPNAME) *
	rm -r zip

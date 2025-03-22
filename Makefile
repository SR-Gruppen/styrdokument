.PHONY: all clean reglemente stadgar incidenthantering instruktioner mallar riktlinjer foreningar

all: reglemente stadgar incidenthantering instruktioner mallar riktlinjer foreningar

clean:
	rm -rf aux
	rm -rf instruktioner
	rm -rf mallar
	rm -rf riktlinjer
	rm -rf foreningar

reglemente:
	latexmk -xelatex -outdir=aux src/reglemente.tex
	mv aux/reglemente.pdf .

stadgar:
	latexmk -xelatex -outdir=aux src/stadgar.tex
	mv aux/stadgar.pdf .

incidenthantering:
	latexmk -xelatex -outdir=aux src/incidenthantering.tex
	mv aux/incidenthantering.pdf .

instruktioner:
	for f in $$(find src/instruktioner -type f -name '*.tex'); do \
		rel=$${f#src/instruktioner/}; \
		targetDir=instruktioner/$$(dirname "$$rel"); \
		auxDir=aux/instruktioner/$$(dirname "$$rel"); \
		mkdir -p "$$auxDir" "$$targetDir"; \
		latexmk -xelatex -outdir="$$auxDir" "$$f"; \
		mv "$$auxDir/$$(basename "$$f" .tex).pdf" "$$targetDir/"; \
	done

mallar:
	for f in $$(find src/mallar -type f -name '*.tex'); do \
		rel=$${f#src/mallar/}; \
		targetDir=mallar/$$(dirname "$$rel"); \
		auxDir=aux/mallar/$$(dirname "$$rel"); \
		mkdir -p "$$auxDir" "$$targetDir"; \
		latexmk -xelatex -outdir="$$auxDir" "$$f"; \
		mv "$$auxDir/$$(basename "$$f" .tex).pdf" "$$targetDir/"; \
	done

riktlinjer:
	for f in $$(find src/riktlinjer -type f -name '*.tex'); do \
		rel=$${f#src/riktlinjer/}; \
		targetDir=riktlinjer/$$(dirname "$$rel"); \
		auxDir=aux/riktlinjer/$$(dirname "$$rel"); \
		mkdir -p "$$auxDir" "$$targetDir"; \
		latexmk -xelatex -outdir="$$auxDir" "$$f"; \
		mv "$$auxDir/$$(basename "$$f" .tex).pdf" "$$targetDir/"; \
	done

foreningar:
	for f in $$(find src/foreningar -type f -name '*.tex'); do \
		rel=$${f#src/foreningar/}; \
		targetDir=foreningar/$$(dirname "$$rel"); \
		auxDir=aux/foreningar/$$(dirname "$$rel"); \
		mkdir -p "$$auxDir" "$$targetDir"; \
		latexmk -xelatex -outdir="$$auxDir" "$$f"; \
		mv "$$auxDir/$$(basename "$$f" .tex).pdf" "$$targetDir/"; \
	done

TILS = $(shell find . -mindepth 2 -not -path "./venv*" -and -type f -iname "*.md")

til.apkg: venv styles.css ${TILS}
	. ./venv/bin/activate && python3 markdown-to-anki.py

venv:
	python3 -m venv venv
	. ./venv/bin/activate && pip install pygments markdown2 genanki

styles.css:
	pygmentize -S vim -f html -a .codehilite > styles.css

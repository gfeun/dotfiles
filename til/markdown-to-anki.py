from pathlib import Path

import genanki
import markdown2

my_anki_deck = genanki.Deck(2059400110, "TIL")

my_model = genanki.Model(
    1607392319,
    "Simple Model",
    fields=[{"name": "Question"}, {"name": "Answer"},],
    templates=[
        {
            "name": "Card 1",
            "qfmt": "{{Question}}",
            "afmt": '{{FrontSide}}<hr id="answer">{{Answer}}',
        },
    ],
    css=open("./styles.css").read(),
)

# Get first level directories
p = Path(".")
dirs = [d for d in p.iterdir() if d.is_dir()]

for path in p.glob("*/*.md"):
    with path.open("r", encoding="utf-8") as f:
        # Convert markdown to html
        html = markdown2.markdown(f.read(), extras=["fenced-code-blocks"])
        # Question on first line, answer on the rest
        question, answer = html.split("\n", 1)
        # Create note and add tag using note directory name ("vim", "cloud" ...)
        my_anki_deck.add_note(
            genanki.Note(
                model=my_model, fields=[question, answer], tags=[path.parent.name]
            )
        )

genanki.Package(my_anki_deck).write_to_file("til.apkg")

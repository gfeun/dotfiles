from pathlib import Path

import genanki
import markdown2

my_anki_deck = genanki.Deck(2059400110, "TIL")


# Custom note class to allow for card answer modification while keeping the same id
# The guid is only computed from the card title field
# This allows to update a deck without Anki thinking it is a brand new one
class MyNote(genanki.Note):
    @property
    def guid(self):
        return genanki.guid_for(self.fields[0])


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
            MyNote(model=my_model, fields=[question, answer], tags=[path.parent.name])
        )

genanki.Package(my_anki_deck).write_to_file("til.apkg")

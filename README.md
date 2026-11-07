# Magic Public Notation (MPN)

**A record of what happened, not a recipe for making it happen again.**

MPN is a proposed open, text-based format for the **public history of a
two-player Magic: The Gathering game**: everything both players and any
onlooker at the table could see, and never a hidden card. A game recorded by
one program can be read, replayed as a sequence of public states and shown
as a readable move list by another, the way chess games travel as PGN.

**Status: MPN 0.1, a draft** (21 October 2026), format identifier `MPN/0.1`.
It is a community proposal, independent of any one program, and not an
official Magic standard. Developers of other Magic programs (clients,
simulators, tournament tools, archives) are invited to read it, implement it
and shape it.

## What is here

| | |
|---|---|
| [`mpn-specification.md`](mpn-specification.md) | **The specification**: encoding and grammar, headers, identity and visibility, the public state, the event vocabulary, ordering and reconstruction, writing and reading, limits and trust, compatibility, and the conformance checklist. |
| [`mpn-move-list.md`](mpn-move-list.md) | **The move list**: how a record is told for people, one action a line under its phase, defined byte for byte. |
| [`mpn-implementation-guide.md`](mpn-implementation-guide.md) | **The implementation guide**: what to build in another Magic program (a writer, a reader, the move list), how the work is accepted, and the pitfalls. |
| [`mpn-examples/`](mpn-examples/) | Four complete records and two expected move lists: the acceptance tests. |
| [`reference/`](reference/) | The reference reader and move-list renderer (GDScript, Godot 4) and a script that runs the acceptance tests. |
| [`implementations/`](implementations/) | Programs that read or write MPN, and their notes. |
| [`CHANGELOG.md`](CHANGELOG.md) | What changed, version by version. |

## A taste

A record begins with its headers, then one numbered record a line:

```text
[Notation "MPN/0.1"]
[Visibility "public"]
[Coverage "public-observations"]
[Started "2026-10-24T16:11:19Z"]
```

and its move list begins like this (shortened, from
[`knights-and-raiders.txt`](mpn-examples/knights-and-raiders.txt)):

```text
[W "White Wizard"]
[B "Black Wizard"]
[Date "2026-10-24"]
[Result "1-0"]

Symbols
  Plains          a land played
  Savannah Lions  a spell cast (it resolved unless told otherwise)
  →               its targets; after damage, the life the player has left (→ B 12)
  ⚔               attacks; "Wall blocks Knight" a block
  †               died, or went to its owner's graveyard
  #               the life that ended the game, as chess's mate
```

## Implementing MPN

1. Read the [implementation guide](mpn-implementation-guide.md), then the
   [specification](mpn-specification.md) and the
   [move list](mpn-move-list.md).
2. Write your own reader, writer and move list in your program's language.
3. Check them against [`mpn-examples/`](mpn-examples/): your move list must
   turn each example record into its `.txt` byte for byte, your reader must
   accept every example and refuse broken records, and your records must
   never carry a hidden card.
4. Tell us: open an issue so your program can be listed under
   [`implementations/`](implementations/).

## Implementations

| Program | Writes | Reads | Move list | Notes |
|---|---|---|---|---|
| [ShandalarGodot](https://github.com/b0realis/ShandalarGodot) | yes | yes | yes | The first implementation; a remake of MicroProse's 1997 Magic: The Gathering. [Its notes](implementations/shandalar-godot.md). |

## Taking part

MPN is meant to be developed together by the programs that use it.

- **Questions, reports from an implementation, proposals**: open an
  [issue](https://github.com/b0realis/MagicPublicNotation-MPN/issues). For a
  change to the format, say what a record could not express (or what a
  reader misreads) and show an example.
- **Changes to the documents** come as pull requests, after the issue that
  discusses them.
- A change that would make an existing reader misread a record needs a new
  format identifier; additions that old readers can ignore stay within the
  version (see [§11](mpn-specification.md#11-compatibility-and-extensions)).

## Licence

The specification, the guides and the other documents are licensed under
[Creative Commons Attribution 4.0](LICENSE) (CC BY 4.0): use, adapt and
publish them, crediting this project. The reference code and the example
records are licensed under the [MIT licence](LICENSE-CODE), so any program,
open or closed, may build on them.

Magic: The Gathering is a trademark of Wizards of the Coast. MPN is an
independent community project, not affiliated with or endorsed by Wizards of
the Coast.

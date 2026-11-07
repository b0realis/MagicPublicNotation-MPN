# The reference reader and move list (GDScript, Godot 4)

Copies of the first implementation's two portable pieces, from
[ShandalarGodot](https://github.com/b0realis/ShandalarGodot):

| File | What it does |
|---|---|
| [`mpn_codec.gd`](mpn_codec.gd) | `MpnCodec.parse(text)` reads and validates an MPN 0.1 record into `{headers, records, finished, error}` (`error` is `""` when the record is valid); `MpnCodec.state_at(records, index)` folds the `state` patches into the public table at any record. |
| [`mpn_move_list.gd`](mpn_move_list.gd) | `MpnMoveList.text(document)` renders a parsed record as the move list [`../mpn-move-list.md`](../mpn-move-list.md) defines. |
| [`check_examples.gd`](check_examples.gd) | The acceptance test: every example in [`../mpn-examples/`](../mpn-examples/) must be a valid record, and each one with a `.txt` beside it must render to that text byte for byte. |

They need nothing but Godot 4 (developed on 4.7): no game engine, card
database or art. The writer is part of the game's engine and is not copied
here; see [`mpn_recorder.gd`](https://github.com/b0realis/ShandalarGodot/blob/main/engine/records/mpn_recorder.gd).

Run the acceptance test from the repository's root:

```sh
godot --headless --path reference --import
godot --headless --path reference -s check_examples.gd
```

It prints one line per example and exits 0 when everything matches.

They are references, not the definition: where they and the specification
disagree, the specification wins (see [§13](../mpn-specification.md#13-reference-implementation-and-gaps)
for the reference reader's known leniencies).

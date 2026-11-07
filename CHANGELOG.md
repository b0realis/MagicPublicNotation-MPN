# Changelog

MPN versions are drafts while the major number is 0. A record names its
version in its first header, `[Notation "MPN/0.1"]`; the identifier changes
only when a change would make an existing reader misread a record.

## MPN 0.1 — draft, 21 October 2026

- The record format: headers, the public state and its patches, public
  handles, the event vocabulary, ordering and reconstruction, limits and
  the conformance checklist ([`mpn-specification.md`](mpn-specification.md)).

### Additions within 0.1

- **24 October 2026** — the move list, a readable rendering of a record,
  defined byte for byte ([`mpn-move-list.md`](mpn-move-list.md)); its two
  worked examples with their expected text; and the implementation guide
  ([`mpn-implementation-guide.md`](mpn-implementation-guide.md)). Writers
  name a card that left play out of sight in its `leave` and `die` events by
  the handle it had (§4's historical handles); earlier records omit
  `object` there.
- **7 November 2026** — MPN moves to its own repository, so that other Magic
  programs can take part in its development.

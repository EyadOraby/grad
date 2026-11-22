# Brand

**SANAD** (سند, "support"). Public services for people with disabilities in Egypt.

## Personality

Calm and civic. Clear before clever: it should feel like a well-run public office that treats everyone with patience.

## Colour

| Name | Hex | Use |
|---|---|---|
| Deep teal | `#0E4E5C` | Primary actions, headers, the wordmark |
| Teal soft | `#2E7180` | Secondary shapes in emblems |
| Muted gold | `#B8924A` | Small accents only |
| Sand | `#F6F1E7` | Page background |
| Card | `#FFFDF9` | Cards, with `#E4DBCB` borders |
| Ink | `#13262C` | Text |

Every text colour pair meets WCAG AA (4.5:1), and the high-contrast setting in Accessibility switches to black on white.

## Type

**Atkinson Hyperlegible**, designed by the Braille Institute for readers with low vision, with **Noto Sans Arabic** for Arabic. Both are SIL Open Font License, bundled in `assets/fonts`. The text-size setting scales everything.

## Illustration

Geometric emblems drawn in code (`lib/views/widgets/civic_emblem.dart`): circles, rectangles and arches in teal and gold on a sand disc, with no outlines, gradients or stock art. There are emblems for government, medical, jobs, doctors, hospitals, radiology, physiotherapy, ID cards, applications and the voice assistant.

## Wordmark

A teal tile with the Arabic letter س beside "SANAD" (or سند in Arabic) in wide-tracked Atkinson Bold.

## Avoid

Isometric stock illustrations, bright greens, playful motion and decorative fonts.

## Font files

The bundled fonts are trimmed for the web, where Flutter downloads every font before the first frame: variable axes are pinned to the weights the app uses and each font keeps only the script it is used for (Latin or Arabic), with fontTools. Total: 932 KB to 254 KB.

# ChatGuard

**By Ceaika and Swifty with original structure for the code before it was compiled in Squirrel**

A client-side Northstar mod that automatically blocks slurs and offensive messages from appearing in your chat - designed for streamers and anyone who wants a cleaner experience in Titanfall 2 multiplayer.

---

## Features

- **Slur detection** - blocks a wide range of racial, homophobic,and other slurs
- **Phrase detection** - blocks threatening and hateful phrases commonly used in gaming chat
- **Leet speak bypass prevention** - converts common leet speak substitutions before checking (e.g. `3x4mpl3` → `example`)
- **Repeat character collapsing** - catches attempts like `eeeeeexxxxxaaaaaaampppppleeee` by collapsing repeated letters before checking
- **Separator stripping** - strips dashes, dots, spaces and other characters people insert to evade filters
- **Local notification** - displays a red `[ChatGuard] [PlayerName] is using offensive language` message in your chat when something is blocked

---

## Installation

1. Install via the Thunderstore mod manager, or manually place the `Ceaika.ChatGuard` folder into:
```
Titanfall2/R2Northstar/mods/
```
2. Launch the game through Northstar as normal.

---

## Notes

- This mod is **client-side only** - it only affects what you see. Other players on the server will still see blocked messages on their screens unless they also have the mod installed.
- Works on vanilla servers when using Northstar as a client mod loader.

---

## Changelog

### 1.0.0
- Initial release

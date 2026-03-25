# ChatGuard

**By Ceaika and Swifty with original structure for the code before it was compiled in Squirrel**

A client-side Northstar mod that automatically blocks slurs and offensive messages from appearing in your chat, designed for streamers and anyone who wants a cleaner experience in Titanfall 2 multiplayer.

---

## Features

- **Slur detection** - blocks a wide range of racial, homophobic, and other slurs
- **Phrase detection** - blocks threatening and hateful phrases commonly used in gaming chat
- **Leet speak bypass prevention** - converts common leet speak substitutions before checking (e.g. `3x4mpl3` -> `example`)
- **Repeat character collapsing** - catches attempts like `eeeeeexxxxxaaaaaaampppppleeee` by collapsing repeated letters before checking
- **Separator stripping** - strips dashes, dots, spaces and other characters people insert to evade filters
- **Local notification** - displays a red `[ChatGuard] [PlayerName] is using offensive language` message in your chat when something is blocked
- **Kindness Mode** - instead of blocking offensive messages, replaces them with a random friendly message that appears to come from the offending player

---

## Installation

1. Install via the Thunderstore mod manager, or manually place the `Ceaika.ChatGuard` folder into:
```
Titanfall2/R2Northstar/mods/
```
2. Launch the game through Northstar as normal.

---

## Kindness Mode

Kindness Mode is an optional toggle that changes how offensive messages are handled. Instead of silently blocking the message and showing you a red notification, it replaces the offensive message with a random kind phrase that appears to come from the offending player. They won't know it happened - only you see the replacement.

Example phrases include things like:
- "Teamwork makes the dream work!"
- "I'm having a stressful day, please excuse my manners."
- "No hard feelings, just having fun!"

To toggle Kindness Mode:
1. Open the Northstar Mods menu in game
2. Navigate to Settings
3. Find ChatGuard under the mod list
4. Toggle "Kindness Mode" 1 (enabled) or 0 (disabled)

It is disabled by default and your preference is saved between sessions.

---

## Notes

- This mod is **client-side only** - it only affects what you see. Other players on the server will still see blocked messages on their screens unless they also have the mod installed.
- Works on vanilla servers when using Northstar as a client mod loader.

---

## Changelog

### 1.1.0
- Added Kindness Mode - replaces offensive messages with a random friendly message instead of blocking them
- Added toggleable Mod Settings menu entry for Kindness Mode (disabled by default)
- Fixed leet speak conversion only replacing the first occurrence of each substitution
- Optimised slur and phrase checking with loops instead of repeated if statements

### 1.0.0
- Initial release

# Simple for Jas — Epix Pro (Gen 2) 42 mm

Independent recreation of a minimalist layout photographed on a Fenix 7 47 mm. This is **not** a modification of mr3ska's TotallySimple app:
its source and settings were unavailable. The photographic reference cannot
establish every original setting or guarantee an identical font match.

Fixed black background, white Garmin numerals, English weekday and day of
month right-aligned above a short divider. No extra data or settings. 24-hour
time without an hour leading zero; local time and calendar follow the watch.
Native Garmin fonts are used, not copied proprietary artwork. Always-on mode
dims the display and moves the drawing slightly minute by minute. Watch display
settings still control whether always-on is enabled.

## Credits

The original watch-face design inspiration is **TotallySimple by mr3ska**:
[Original Connect IQ listing](https://apps.garmin.com/en-US/apps/43f92703-8565-42a3-9060-2e74871f37b4).
Credit to mr3ska for the original minimalist design. This project is an
independent implementation for the Epix Pro (Gen 2) 42 mm, not an official
port, fork, or release of TotallySimple, and is not affiliated with or endorsed
by its developer. No original source code or proprietary assets are included.

## Install

Download the sideload package from this repository's **Releases** page and unzip it.

1. Connect **Epix Pro (Gen 2) 42 mm** to a computer with its USB data cable.
2. Open the watch's storage and copy `SimpleForJas.prg` into `GARMIN/APPS`.
   On Windows it may appear under **This PC → epix → Internal Storage**.
   A Mac needs a Garmin-compatible MTP file-transfer application.
3. Safely disconnect the watch. Hold **MENU → Watch Face**, then select
   **Simple for Jas** (use **Add New** if it is not in the initial list).
4. This is a sideloaded app, not a Connect IQ Store installation. Do not try to
   open the PRG on the phone or copy it to a Fenix 7.

To uninstall, choose a different face and delete this sideloaded PRG from
`GARMIN/APPS` while connected by USB.

## Verification

- Compiled successfully with Garmin Connect IQ SDK 9.3.0 for `epix2pro42mm`.
- No compiler warnings in the final build.
- **Not yet tested on the physical watch.** Simulator execution was blocked by
  missing Garmin system font assets (`Invalid Font Specified`); therefore no
  simulator screenshot or successful runtime validation is claimed. The face
  uses native font constants documented for this target, which its firmware
  supplies. Check appearance, minute/date rollover, and wake/always-on behaviour
  on the watch before treating this as finished visual matching.

## Rebuild

Java 17+, Garmin Connect IQ SDK, and the `epix2pro42mm` device profile are needed.
Install the device profile and its fonts through Garmin SDK Manager for a
fully functional simulator. The initial build used device definitions from
the public `mgallesio/granbike-face-builder` mirror; no mirrored SDK assets
are distributed with this project.

```sh
CIQ_SDK=/path/to/sdk CIQ_KEY=/path/to/developer_key.der bash build.sh
```

Signing keys are deliberately kept outside this project and the distribution.

Output: `dist/SimpleForJas.prg`.

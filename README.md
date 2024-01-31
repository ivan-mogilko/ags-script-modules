# ags-script-modules

This is my personal collection of AGS Script modules and Demo games for them.<br>
Most of these are posted with further instructions on [official AGS forums](https://www.adventuregamestudio.co.uk/forums/index.php?board=10.0).
Recently I started writing better docs in this repository's wiki, but only few modules are documented at this point:
https://github.com/ivan-mogilko/ags-script-modules/wiki

The modules are arranged in subdirs roughly by their kind.<br>
There's a special "_dump" dir where I store random scripts; these are either not good for a real module or something I just did not have time to tidy up yet.

All scripts are free to use and released under [MIT License](LICENSE.md).

---

### List of modules:

**DoubleClick** - handles double mouse clicks in games (AGS does not support that itself).<br>
* Code: https://github.com/ivan-mogilko/ags-script-modules/tree/master/scripts/ui/DoubleClick
* Latest release: https://github.com/ivan-mogilko/ags-script-modules/releases/tag/initial
* Forum thread: https://www.adventuregamestudio.co.uk/forums/modules-plugins-tools/module-doubleclick-keylistener-detect-double-clicks-and-more/

**DragDrop** - lets drag objects around in your game.<br>
* Code: https://github.com/ivan-mogilko/ags-script-modules/tree/master/scripts/ui/DragDrop
* Demo game: https://github.com/ivan-mogilko/ags-script-modules/tree/master/demos/DragDropDemo
* Latest release: https://github.com/ivan-mogilko/ags-script-modules/releases/tag/dragdropcommon-1.2.0
* Documentation: https://github.com/ivan-mogilko/ags-script-modules/wiki/Drag-&-Drop-module
* Forum thread: https://www.adventuregamestudio.co.uk/forums/modules-plugins-tools/module-dragdrop-1-1-0-helps-to-drag-things-around-your-ags-game!/

**KeyListener** - records key and mouse button state changes and sequences.<br>
This module was not tested much, and its practical usefulness is frankly not clear.<br>
* Code: https://github.com/ivan-mogilko/ags-script-modules/tree/master/scripts/ui/KeyListener
* Latest release: https://github.com/ivan-mogilko/ags-script-modules/releases/tag/initial
* Forum thread: https://www.adventuregamestudio.co.uk/forums/modules-plugins-tools/module-doubleclick-keylistener-detect-double-clicks-and-more/

**ObjectPool** - manages a limited list of reusable objects which may be "free" or "in use".<br>
* Code: https://github.com/ivan-mogilko/ags-script-modules/tree/master/scripts/util
* Latest release: https://github.com/ivan-mogilko/ags-script-modules/releases/tag/objectpool-1.0.1
* Forum thread: https://www.adventuregamestudio.co.uk/forums/modules-plugins-tools/module-objectpool-keep-record-of-reusable-objects/

**Timer** - object-oriented Timer implementation, offers wider capabilities compared to AGS built-in timer API.<br>
* Code: https://github.com/ivan-mogilko/ags-script-modules/tree/master/scripts/util
* Latest release: https://github.com/ivan-mogilko/ags-script-modules/releases/tag/initial
* Forum thread: https://www.adventuregamestudio.co.uk/forums/modules-plugins-tools/module-timer-0-9-0-alternate-variant/

**TypedText** - implements "typewriter" effect: text being typed char by char, on a GUI control, Overlay, or DrawingSurface.
* Code: https://github.com/ivan-mogilko/ags-script-modules/tree/master/scripts/gui/TypedText
* Demo game: https://github.com/ivan-mogilko/ags-script-modules/tree/master/demos/TypedTextDemo
* Latest release: https://github.com/ivan-mogilko/ags-script-modules/releases/tag/typedtext-1.0.0
* Forum thread: https://www.adventuregamestudio.co.uk/forums/modules-plugins-tools/module-typedtext-0-7-0/

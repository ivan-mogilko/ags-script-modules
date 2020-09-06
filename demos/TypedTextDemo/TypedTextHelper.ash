// TypedTextHelper is open source under the MIT License.
//
// TERMS OF USE - TypedTextHelper MODULE
//
// Copyright (c) 2017-present Ivan Mogilko
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of
// this software and associated documentation files (the "Software"), to deal in
// the Software without restriction, including without limitation the rights to
// use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
// the Software, and to permit persons to whom the Software is furnished to do so,
// subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
// FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
// IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//
//////////////////////////////////////////////////////////////////////////////////////////
//
// Collection of helper structs and functions for simplified TypedText usage.
//
//////////////////////////////////////////////////////////////////////////////////////////

#ifndef __TYPEDTEXTHELPER_MODULE__
#define __TYPEDTEXTHELPER_MODULE__

#ifndef __TYPEDTEXT_MODULE__
#error TypedTextHelper requires TypedText module
#endif

#define TYPEDTEXTHELPER_VERSION_00_00_70_00

#ifver 3.4.0
  #ifdef SCRIPT_COMPAT_v321
    #define TYPEDTEXTHELPER_USEOLDOVERLAY
  #endif
#endif
#ifnver 3.4.0
  #define TYPEDTEXTHELPER_USEOLDOVERLAY
#endif

/// Maximal supported presets, per each kind
#define TYPEDTEXTHELPER_MAXPRESETS 8
/// Maximal supported active typewriters (handled by TypedTextHelper module)
#define TYPEDTEXTHELPER_MAXTYPEWRITERS 8

/// Static methods for setting up presets
struct TypewriterPreset
{
  /// Set general parameters for the specified preset
  import static void SetGeneral(int preset, int delay_min, int delay_max, TypedDelayStyle style, int read_time = 12);
  /// Set caret parameters for the specified preset
  import static void SetCaret(int preset, int flash_on_time, int flash_off_time, TypedCaretStyle style, String caret_str, int caret_sprite = 0);
  /// Set sound parameters for the specified preset
  import static void SetSounds(int preset, AudioClip *type_sound, AudioClip *caret_sound, AudioClip *end_sound);
  import static void SetSoundArray(int preset, AudioClip *type_sounds[], int type_sound_count,
                                   AudioClip *caret_sound, AudioClip *end_sound);
};

#define NO_TYPEWRITER 0

struct TypewriterRunners
{
  /// Get number of currently running typewriters
  readonly import static attribute int  ActiveCount;
  /// Get number of maximal supported typewriters that can run simultaneously
  readonly import static attribute int  MaxCount;
  /// Get whether given typewriter ID is currently running
  readonly import static attribute bool IsActive[];
  /// Get whether given typewriter ID is blocking
  readonly import static attribute bool IsBlocking[];
  
  /// Stop typewriter under given ID
  import static void Cancel(int id);
};

/// Print TypedText as a text on button; returns typewriter ID
import int Typewriter(this Button*, String text, BlockingStyle bs, int preset = 0);
/// Print TypedText as a text on label; returns typewriter ID
import int Typewriter(this Label*, String text, BlockingStyle bs, int preset = 0);
#ifver 3.4.0
/// Print TypedText as a text on created overlay; returns typewriter ID
import int Typewriter(static Overlay, int x, int y, int color, FontType font, String text, BlockingStyle bs, int preset = 0);
#endif
#ifdef TYPEDTEXTHELPER_USEOLDOVERLAY
/// Print TypedText as a text on created overlay; returns typewriter ID
import int TypewriteOnOverlay(int x, int y, int color, FontType font, String text, BlockingStyle bs, int preset = 0);
#endif

#endif  // __TYPEDTEXTHELPER_MODULE__

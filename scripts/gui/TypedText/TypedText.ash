// TypedText is open source under the MIT License.
//
// TERMS OF USE - TypedText MODULE
//
// Copyright (c) 2017-2025 Ivan Mogilko
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
// Module performs continious text typing over time, in typewriter style,
// letter by letter, optionally drawing custom caret in the end of the text.
//
//----------------------------------------------------------------------------------------
//
// TODO:
//  - Means for user to get number of lines currently displayed. This may
//    require advanced mechanism for updating TypedTextRenderer in case
//    derived implementation changes its size (similar to what Drawing
//    is doing).
//  - More clear solution for caret return sound timing (make sure it plays
//    before caret is drawn on the new line?).
//
//////////////////////////////////////////////////////////////////////////////////////////

#ifndef __TYPEDTEXT_MODULE__
#define __TYPEDTEXT_MODULE__

#define TYPEDTEXT_VERSION_00_01_01_00

/// Maximal allowed random sounds
/// ( because pre-3.4.0 AGS does not support dynamic arrays in structs... :-( )
#define TYPEDTEXTRENDER_MAXSOUNDS 3

/// Whitespace/caret-return delay style defines relation of special case
/// delays to the base type delay.
/// Idea is conforming to the Phemar's Typewriter module.
enum TypedDelayStyle
{
  /// wait for the same amount of time as after regular letters
  eTypedDelay_Uniform = 0,
  /// wait twice as long after whitespaces
  eTypedDelay_LongSpace,
  /// wait twice as less after whitespaces
  eTypedDelay_ShortSpace,
  /// randomly choose a style every time
  eTypedDelay_Mixed
};

///////////////////////////////////////////////////////////////////////////////
//
// TypedText class depicts a state of continiously typed string of text
// at any given time.
//
///////////////////////////////////////////////////////////////////////////////
struct TypedText
{
  //
  // Configuration
  //

  /// Base delay (in ticks) between every typing event
  import attribute int              TypeDelay;
  /// Bounds for random base delay
  import attribute int              TypeDelayMin;
  import attribute int              TypeDelayMax;
  import attribute TypedDelayStyle  TypeDelayStyle;
  /// Time (in ticks) the caret stays shown
  import attribute int              CaretFlashOnTime;
  /// Time (in ticks) the caret stays hidden
  import attribute int              CaretFlashOffTime;
  /// Time (in ticks) given to read one text character
  import attribute int              TextReadTime;
  
  //
  // Event signals
  //
  
  /// Gets if the new character was just typed
  readonly import attribute bool    EvtCharTyped;
  /// Gets if the text has just ended being typed
  readonly import attribute bool    EvtFinishedTyping;
  
  //
  // State control
  //
  
  /// Full string that has to be typed
  readonly import attribute String  FullString;
  /// Part of string that is supposed to be shown at current time
  readonly import attribute String  CurrentString;
  /// Part of string that was 'typed' during latest update
  readonly import attribute String  LastTyped;
  
  /// Tells whether TypedText has active content to process or display
  readonly import attribute bool    IsActive;
  /// Tells whether TypedText is in process of typing text
  /// (return FALSE if either no text is set, or text is already fully typed)
  readonly import attribute bool    IsTextBeingTyped;
  /// Tells whether TypedText is waiting for the text to be read by player
  /// (return FALSE when reading timer has ran out, regardless of other states)
  readonly import attribute bool    IsWaitingForReader;
  /// Tells whether TypedText is currently idling, either not having a content,
  /// or after finishing all the required actions (typing & waiting for reader)
  readonly import attribute bool    IsIdle;
  /// Tells whether caret should be currently displayed
  readonly import attribute bool    IsCaretShown;
  
  //
  // Main functionality
  //
  
  /// Gets/sets paused state
  import attribute bool             Paused;
  
  /// Clears all text and resets all timers
  import void                       Clear();
  /// Sets new string, resets all timers and commences typing
  import void                       Start(String text);
  /// Skips all the remaining typing
  import void                       Skip();
  
  /// Update typed text state, advancing it by single tick
  import void                       Tick();
  
  
  //
  // Internal implementation
  //
  
  // Internal commands implementation, for calling from inheriting classes
  protected import void             _Clear();
  protected import void             _Start(String line);
  protected import void             _Tick();
  
  // Strings
  protected String                  _full;
  protected String                  _cur;
  protected String                  _last;
  
  // Delay settings
  protected int                     _typeDelayMin;
  protected int                     _typeDelayMax;
  protected TypedDelayStyle	        _typeDelayStyle;
  // Caret settings
  protected int                     _caretOnTime;
  protected int                     _caretOffTime;
  // Ticks given to read one text character
  protected int                     _textReadTime;
  
  // Paused flag
  protected bool                    _paused;
  // Ticks left till next type event
  protected int                     _typeTimer;
  // Ticks left till caret state change
  protected int                     _caretFlashTimer;
  // Ticks left for the text to be read
  protected int                     _readerTimer;
  // Tells that the new character was just typed
  protected bool                    _justTyped;
  // Tells that the text has just ended being typed
  protected bool                    _justFinishedTyping;
  
  // Internal flag that tells whether object's state has changed
  protected bool                    _hasChanged;
};


/// Style of the caret displayed during typing
enum TypedCaretStyle
{
  /// No caret display
  eTypedCaret_None = 0, 
  /// Flash last character
  eTypedCaret_LastChar, 
  /// Draw separate caret at the next assumed character location
  eTypedCaret_Explicit
};

///////////////////////////////////////////////////////////////////////////////
//
// TypewriterRender is an abstract intermediate class for the TypedText
// renderers.
//
///////////////////////////////////////////////////////////////////////////////
struct TypewriterRender extends TypedText
{
  /// Caret display style
  import attribute TypedCaretStyle CaretStyle;
  /// A string (or single character) that represents typewriter caret
  import attribute String          CaretString;
  
  /// The only sound to play when a character is typed
  import attribute AudioClip *     TypeSound;
  /// Array of sounds to choose at random when a character is typed
  readonly import attribute AudioClip *TypeSounds[];
  /// Number of typing sounds registered
  readonly import attribute int    TypeSoundCount;
  /// Sound to play when the line break is met
  import attribute AudioClip *     CaretSound;
  /// Sound to play when the typewriter finished typing text
  import attribute AudioClip *     EndSound;
  
  /// Sets the array of sounds to play at random when character is typed
  import void                      SetRandomTypeSounds(AudioClip *sounds[], int count);
  

  // Returns current typed string modified according to the caret style:
  // - if style is LastChar and caret is currently flashing off, then returns
  //   string with last typed character erased; if caret is flashing on, then
  //   string is not changed;
  // - if style is Explicit and CaretString is set, then appends caret chars
  //   to the string (only if caret is currently flashing on)
  import String                    GetStringWithCaret();
  
  // Internal commands implementation, for calling from inheriting classes
  protected import void            _RenderClear();
  protected import void            _RenderSkip();
  protected import void            _RenderStart(String text);
  protected import void            _RenderTick();
  
  protected TypedCaretStyle        _caretStyle;
  protected String                 _caretStr;
  protected AudioClip *            _typeSound[TYPEDTEXTRENDER_MAXSOUNDS];
  protected int                    _typeSoundCount;
  protected AudioClip *            _caretSound;
  protected AudioClip *            _endSound;
};

/// Clears all text and resets all timers
import void Clear(this TypewriterRender*);
/// Skips all the remaining typing
import void Skip();
/// Sets new string, resets all timers and commences typing
import void Start(this TypewriterRender*, String text);
/// Update typed text state, advancing it by single tick
import void Tick(this TypewriterRender*);


///////////////////////////////////////////////////////////////////////////////
//
// TypewriterButton draws TypedText on the provided Button.
//
///////////////////////////////////////////////////////////////////////////////
struct TypewriterButton extends TypewriterRender
{
  /// Button to draw text on
  import attribute Button *TypeOnButton;
  
  protected Button* _button;
};

/// Clears all text and resets all timers
import void Clear(this TypewriterButton*);
/// Sets new string, resets all timers and commences typing
import void Start(this TypewriterButton*, String text);
/// Update typed text state, advancing it by single tick
import void Tick(this TypewriterButton*);


///////////////////////////////////////////////////////////////////////////////
//
// TypewriterLabel draws TypedText on the provided Label.
//
///////////////////////////////////////////////////////////////////////////////
struct TypewriterLabel extends TypewriterRender
{
  /// Label to draw text on
  import attribute Label *TypeOnLabel;
  
  protected Label* _label;
};

/// Clears all text and resets all timers
import void Clear(this TypewriterLabel*);
/// Sets new string, resets all timers and commences typing
import void Start(this TypewriterLabel*, String text);
/// Update typed text state, advancing it by single tick
import void Tick(this TypewriterLabel*);


///////////////////////////////////////////////////////////////////////////////
//
// TypewriterOverlay draws TypedText on the owned overlay.
//
///////////////////////////////////////////////////////////////////////////////
struct TypewriterOverlay extends TypewriterRender
{
  /// Default overlay parameters
  import attribute int X;
  import attribute int Y;
  import attribute int Width;
  import attribute FontType Font;
  import attribute int Color;
  
  /// Overlay the speech is printed on
  readonly import attribute Overlay *OwnedOverlay;
  
  // Overlay params
  protected int _x;
  protected int _y;
  protected int _width;
  protected FontType _font;
  protected int _color;
  // Created overlay
  protected Overlay *_o;
};

/// Clears all text and resets all timers
import void Clear(this TypewriterOverlay*);
/// Sets new string, resets all timers and commences typing
import void Start(this TypewriterOverlay*, String text);
/// Update typed text state, advancing it by single tick
import void Tick(this TypewriterOverlay*);


///////////////////////////////////////////////////////////////////////////////
//
// TypedTextUtils is a collection of static helpers.
//
///////////////////////////////////////////////////////////////////////////////
// Default padding that AGS subtracts from the width given to fit the text in,
// calculated as default padding 3 multiplied by 2 (both sides).
#define DEFAULT_DISPLAY_PADDING 6
// Number of pixels to counter some uncertain mistakes in the internal text
// splitting calculations of AGS.
#define INTERNAL_LINE_SPLIT_MISTAKE 2

struct TypedTextUtils
{
  /// Gets/sets string of characters, that are considered a good point at
  /// which the line of text could be split when needed (like spaces and
  /// punctuation characters. Default value is " -=+.,:;!?".
  import static attribute String SplitHintCharacters;
  /// Gets the average height of a line, printed with the given font.
  import static int              GetFontHeight(FontType font);
  // Splits given string into lines by inserting line break characters.
  // Returns the resulting string.
  // max_height, line_height and max_lines parameters are optional, pass
  // SCR_NO_VALUE if you do not want to impose any limit on them.
  // max_width is the obligatory parameter, if it is not set function will
  // return/ empty string.
  import static String SplitText(String text, int max_width, FontType font,
                                 int max_height = SCR_NO_VALUE, int line_height = SCR_NO_VALUE, int max_lines = SCR_NO_VALUE);
};


#endif  // __TYPEDTEXT_MODULE__

// TypedTextDrawing is open source under the MIT License.
//
// TERMS OF USE - TypedTextDrawing MODULE
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
// Module performs rendering of TypedText state to the provided DrawingSurface.
//
//----------------------------------------------------------------------------------------
//
// TODO:
//  - Caret positioning when text is aligned at the right, and when the line of text
//    fills whole line.
//  - Typing text "outwards" when aligned at center or at the right.
//  - Right-to-left text style (semitic languages, etc).
//
//////////////////////////////////////////////////////////////////////////////////////////

#ifndef __TYPEDTEXTDRAWING_MODULE__
#define __TYPEDTEXTDRAWING_MODULE__

#ifndef __TYPEDTEXT_MODULE__
#error TypedTextDrawing requires TypedText module
#endif

#define TYPEDTEXTDRAWING_VERSION_00_01_01_00

// Maximal supported text lines
#define TYPEDTEXTDRAWING_MAXLINES 32

struct TypedTextDrawing extends TypewriterRender
{
  //
  // Configuration
  //
  
  /// Setup drawing position and bounds on the surface
  import void             SetDrawingRect(int x, int y, int width, int height);
  /// Setup text arrangement and display parameters
  import void             SetDrawingParams(FontType font, int color, int bkg_color = COLOR_TRANSPARENT,
                                           Alignment align = eAlignLeft, int line_spacing = 0);
  
  /// X position on surface
  import attribute int    X;
  /// Y position on surface
  import attribute int    Y;
  /// Width of a bounding rect
  import attribute int    Width;
  /// Height of a bounding rect
  import attribute int    Height;
  
  /// Text font
  import attribute FontType Font;
  /// Tells the height of a line of a text (not including spacing)
  readonly import attribute int LineHeight;
  /// Space between text lines
  import attribute int    LineSpacing;
  /// Horizontal alignment of text in line
  import attribute Alignment TextAlign;
  /// Fill colour of the background
  import attribute int    BkgColor;
  /// Text colour
  import attribute int    TextColor;
  
  /// Caret sprite number
  import attribute int    CaretSprite;
  
  //
  // Functionality
  //
  
  /// Render the current state to the given DrawingSurface
  import void             Draw(DrawingSurface *ds);
  
  //
  // Internal implementation
  //
  
  // Window postion
  protected int           _x;
  protected int           _y;
  protected int           _width;
  protected int           _height;
  
  // Text parameters
  protected int           _font;
  protected int           _lineSpacing;
  // Colour and alignment
  protected int           _bkgColor;
  protected int           _textColor;
  protected Alignment     _textAlign;
  
  // Caret sprite number
  protected int           _caretSprite;
  
  //
  // Calculated parameters to help with text arrangement
  //
  
  // The height of the font, in pixels
  protected int           _fontHeight;
  // Number of visible lines of text
  protected int           _maxVisLines;
  // Number of total lines stored in text box memory
  protected int           _lineCount;
  // The x coordinate where each new line begins
  protected int           _lineXDefault;
  // The x coordinates of every line
  protected int           _lineX[TYPEDTEXTDRAWING_MAXLINES];
  // Index of the first and last characters in the full string that correspond to particular line
  protected int           _lineBeginsAt[TYPEDTEXTDRAWING_MAXLINES];
  protected int           _lineEndsAt[TYPEDTEXTDRAWING_MAXLINES];
};

import void Clear(this TypedTextDrawing*);
/// Sets new string, resets all timers and commences typing
import void Start(this TypedTextDrawing*, String text);
/// Update typed text state, advancing it by single tick
import void Tick(this TypedTextDrawing*);

#endif  // __TYPEDTEXTDRAWING_MODULE__

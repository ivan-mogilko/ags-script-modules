//////////////////////////////////////////////////////////////////////////////////////////
//
// AnimatedTextBox module
//
// Author: Ivan K. Mogilko
// Last revision: 2015
//
// A Text Box UI that animates typed text.
//
//////////////////////////////////////////////////////////////////////////////////////////

#define ANIMATEDTEXTBOX_MAXLINES 16
#define ANIMATEDTEXTBOX_PARA_BREAK ']'
#define ANIMATEDTEXTBOX_LINE_BREAK '['

// Structure that describes the extracted paragraph from a longer text
struct ExtractedParagraph
{
  String Text;    // the text to use as next paragraph
  int    Forward; // the number of chars to skip till next paragraph
};
import ExtractedParagraph ParaEx;


struct AnimatedTextBox
{
  // Set text box position
  import void     SetWindow(int x, int y, int width, int height);
  // Set window display
  import void     SetDisplayParams(int bkg_col);
  // Set text display properties
  import void     SetTextParams(int font, int txt_col, int caret_sprite, Alignment text_align, int line_spacing);
  // Set typing animation parameters
  import void     SetAnimParams(int typing_delay, int caret_on_time, int caret_off_time);
  
  // Clears text in the text box
  import void     Clear();
  // Gets a paragraph (number of lines that would fit into text box) from the string and stores
  // in text box memory; calculates line coordinates based on their length and alignment;
  // writes the result to ParaEx global variable; text can be displayed
  // with DisplayText() or SkipTypingAnim()
  import bool     ExtractParagraph(String longText);
  
  // Starts typing animation
  import void     BeginTypingAnim();
  // Tells if text is still being typed
  import bool     IsTextBeingTyped();
  // Skips typing animation and displays all text at once
  import void     SkipTypingAnim();
  
  // Draws text box in its current state; optionally drawing or not drawing a caret
  import void     Draw(DrawingSurface * ds, bool drawCaret = true);
  // Updates text box state, optionally animating or not animating a caret
  import void     Update(bool animateCaret);
  
  
  protected import void DrawWindow(DrawingSurface * ds);
  protected import void DrawText(DrawingSurface * ds, bool drawCaret);
  
  
  // The full text in the text box
  writeprotected String Text;
  // The flag that indicates whether text box has changes that are not yet drawn
  writeprotected bool   ShouldRedraw;
  
  
  // Window postion
  writeprotected int  X;
  writeprotected int  Y;
  writeprotected int  Width;
  writeprotected int  Height;
  // Background colour
  writeprotected int  BkgColor;
  
  // Text font
  writeprotected int  Font;
  // Text colour
  writeprotected int  TextColor;
  // Caret sprite number
  writeprotected int  CaretSprite;
  // Horizontal alignment of text in line
  writeprotected Alignment TextAlign;
  // Space between text lines
  writeprotected int  LineSpacing;
  
  // Delay (in ticks) between every typing event
  writeprotected int  TypingDelay;
  // Time (in ticks) the caret stays shown
  writeprotected int  CaretOnTime;
  // Time (in ticks) the caret stays hidden
  writeprotected int  CaretOffTime;
  
  // The height of the font, in pixels
  protected int       FontHeight;
  // Number of visible lines of text
  protected int       MaxVisLines;
  
  // Number of total lines stored in text box memory
  protected int       LineCount;
  // The x coordinates of every line
  protected int       LineX[ANIMATEDTEXTBOX_MAXLINES];
  // Index of the last character in the full string that corresponds to current line
  protected int       LineEndsAt[ANIMATEDTEXTBOX_MAXLINES];
  
  // Ticks left till next type event
  protected int       TextTypingTimer;
  // Index of the character in full string that was typed last
  protected int       TextTypingIterator;
  // Ticks left till caret state change
  protected int       CaretAnimTimer;
};

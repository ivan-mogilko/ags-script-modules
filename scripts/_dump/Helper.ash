//=============================================================================
// StringQueue - a string that contains a sequence of items, separated by
// particular character or special string.
//=============================================================================
struct StringQueue
{
  String           S; // the main string
  protected String D; // the delimeting string
  bool             EnableQuotedStrings; // treat double quote char as an alternate delimeter
  
  // Get/set delimeter string
  import attribute String Delimeter;

  // Set new item, overwriting any existing text
  import void   PushNew(String s);
  // Append another item; delimeter is applied automatically
  import void   Push(String s);
  
  // Get next item without modifying main string
  import String Peek();
  // Retrieve next item; truncates main string
  import String Pop();
  // Retrieve the remaining items; erases main string
  import String PopAll();
};

//=============================================================================
// Utilities
//=============================================================================
// Get the biggest of two integers
import int Max(static Maths, int a, int b);
// Get the smallest of two integers
import int Min(static Maths, int a, int b);

// String search direction
enum StringSearch
{
  eStringSearchForward, 
  eStringSearchReverse
};

// Safely appends to a string; if the first string is null, returns second one
import String SafeAppend(static String, String first, String second);
// Tells if the string has given substring at given index
import bool ContainsAt(this String *, String substr, int index);
// Find given substring inside the bigger string
import int IndexOfEx(this String *, String needle, int from = 0, StringSearch dir = eStringSearchForward);
// Get leftmost part of the string taking up to 'count' characters
import String Left(this String*, int count);
// Get middle part of the string taking up to 'count' characters, starting from
// 'index'; pass count = -1 to get all the rightmost part of the string
import String Mid(this String*, int index, int count = -1);
// Get rightmost part of the string, taking up to 'count' characters
import String Right(this String*, int count);

// Escapes the text by double-quote chars
import String TakeInQuotes(String text);

//=============================================================================
// GUI helpers
//=============================================================================
import void scrollListBoxDown(ListBox *listBox);

//=============================================================================
// LogFile - a helper class for writing logs.
// Manages file handle. Adds timestamp to every entry.
//=============================================================================
struct LogFile
{
  protected File *F;

  // Open log file for writing
  import bool Open(String filename, bool append = false);
  // Closes log file
  import void Close();
  // Writes a log entry
  import void Write(String text);
};

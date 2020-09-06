//////////////////////////////////////////////////////////////////////////////////////////
//
// AnimatedTextBox module
//
// Author: Ivan K. Mogilko
// Last revision: 2015
//
// An extension to AnimatedTextBox, that supports queueing longer texts, breaking it into
// paragraphs and displaying one after another.
//
//////////////////////////////////////////////////////////////////////////////////////////

enum StoryState
{
  eStoryClear,   // no text queued
  eStoryTyping,  // currently animating typed text
  eStoryWait,    // finished animating current paragraph
  eStoryFinished // finished animating last paragraph
};

struct AnimatedStoryBox extends AnimatedTextBox
{
  // Fast-forwards to then next step: if text typing was animated -
  // skip typing and display all paragraph, if all paragraph was displayed -
  // skip to the next paragraph
  import bool   FastForwardParagraph();
  // Tells if the story box currently displays last paragraph
  import bool   IsLastParagraph();
  // Display next paragraph from the remaining story text
  import bool   NextParagraph();
  // Sets a new full story text
  import void   NewStory(const string text);
  // Gets current story state
  import StoryState GetStoryState();
  // Deletes story text from the text box memory and clears current text box contents
  import void   ClearStory();
  
  // Draws the story box contents on the given drawing surface; deduces whether to
  // draw animated caret or not
  import void   DrawStory(DrawingSurface *ds);
  // Updates the story box state
  import void   UpdateStory();
  
  
  // The full queued story text
  writeprotected String StoryFull;
  // The remaining story text queue
  writeprotected String StoryQueued;
};

//////////////////////////////////////////////////////////////////////////////////////////
//
// RoomExitGrid module
//
// Author: Ivan K. Mogilko
// Last revision: 2015
//
// An UI, depicting room exits in the form of markers on a field.
//
//////////////////////////////////////////////////////////////////////////////////////////

struct RoomExitsGrid extends RoomExits
{
  // Sets up grid object
  import void   Create(int x, int y, int width, int height, int cols, int rows, int slotw, int sloth);
  // Sets grid colours
  import void   SetColours(int bkgColour, int lineColour, int fillColourNormal, int fillColourClicked);
  // Draws the grid on given drawing surface, using specified offset
  import void   Draw(DrawingSurface * ds);
  // Handles mouse click on UI
  import bool   OnMouseClick(int x, int y);
  
  
  // The flag that indicates whether the grid has changes that are not yet drawn
  writeprotected bool ShouldRedraw;
  
  // UI metrics
  protected int X;
  protected int Y;
  protected int Width;
  protected int Height;
  // Number of grid rows and columns
  protected int Cols;
  protected int Rows;
  // Grid cell metrics
  protected int SlotWidth;
  protected int SlotHeight;
  // Spaces between cells
  protected int HorSpace;
  protected int VerSpace;
  
  // Background colour
  protected int BkgColour;
  // Cell line colour
  protected int LineColour;
  // Cell inner colour
  protected int FillColourNormal;
  // Cell inner colour when it is being clicked
  protected int FillColourClicked;
};

//
// Module: Utils
// Author: Ivan Mogilko
//

enum RoomTravelDirection
{
  eRoomTravelUp = 0, 
  eRoomTravelRight, 
  eRoomTravelDown, 
  eRoomTravelLeft, 
  
  eRoomTravelAppear, 
  eRoomTravelUndefined
};

enum TurnDirection
{
  eFaceUp, 
  eFaceUpLeft, 
  eFaceLeft, 
  eFaceDownLeft, 
  eFaceDown, 
  eFaceDownRight, 
  eFaceRight, 
  eFaceUpRight
};

struct SpriteCut
{
  int BaseSprite;
  int X;
  int Y;
  int W;
  int H;
  DynamicSprite *Cut;
  
  import function Set(int sprite, int x, int y, int w, int h);
  import function Delete();
};

struct PixelPerfectDetection
{
  import static GUIControl *GetGUIControl(GUI *gui, int x, int y, bool test_clickable);
};

struct Utils
{
  import static function GameLogicError(String errMessage);
  
  import static RoomTravelDirection GetOppositeTravelDirection(RoomTravelDirection dir);
  import static RoomTravelDirection GetOppositeTurnDirection(TurnDirection dir);
};

import function FaceDirection(this Character*, TurnDirection dir);
import function DrawFrame(this DrawingSurface*, int x1, int y1, int x2, int y2);
import function ReplaceColor(this DynamicSprite*, int old_color, int new_color);
import function ReplaceColor2(this DynamicSprite*, int old_color, int new_color, int old_color2, int new_color2);

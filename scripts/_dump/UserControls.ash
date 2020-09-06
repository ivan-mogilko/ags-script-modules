
enum DragDropMode
{
  eDragDropNone, 
  eDragDropCharacter, 
  eDragDropGui, 
  eDragDropGuiControl,
  eDragDropInventoryItem, 
  eDragDropRoomObject
};

struct DragDrop
{
  DragDropMode Mode;
  int          DragDelay;
  bool         PixelPerfect;
  bool         TestClickable;
  
  bool         IsDragging;
  bool         IsDropping;
  Character    *Char;
  GUI          *Gui;
  GUIControl   *GuiControl;
  InventoryItem *InvItem;
  Object       *RoomObject;
  int          OriginX;
  int          OriginY;
  int          CurrentX;
  int          CurrentY;
  int          HandleOffsetX;
  int          HandleOffsetY;
  
  import static function Enable(DragDropMode mode, int drag_delay, bool pixel_perfect, bool test_clickable);
  import static function Disable();
  
  import static bool IsEnabled();
  import static bool IsDraggingNow();
  import static bool IsDroppingNow();
  import static function Drop();
  import static function DropAt(int x, int y);
  import static function Revert();
  
  import function GetInfo();
  import function GetPosition();
  import function GetObject();
};

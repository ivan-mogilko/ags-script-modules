//////////////////////////////////////////////////////////////////////////////////////////
//
// RoomExits module
//
// Author: Ivan K. Mogilko
// Last revision: 2015
//
// A structure, depicting room exits, that could be bound to any object in the room.
//
//////////////////////////////////////////////////////////////////////////////////////////

struct RoomExits
{
  // Constructs the struct, assigning max supported number of room exits
  import void SetCapacity(int max_exits);
  // Remove all room exits
  import void ClearExits();
  // Set up a room exit; bind room exit with a room object, hotspot or character which interaction event
  // will be called when user clicks on the exit button on grid
  import bool SetExitAsObject(int exit, Object * o, CursorMode mode, bool visible, bool enabled, String text);
  import bool SetExitAsHotspot(int exit, Hotspot * h, CursorMode mode, bool visible, bool enabled, String text);
  import bool SetExitAsCharacter(int exit, Character * c, CursorMode mode, bool visible, bool enabled, String text);
  // Removes specified room exit
  import bool RemoveExit(int exit);
  // Tells if room exit is visible
  import bool IsExitVisible(int exit);
  // Tells if room exit is enabled and will react on user clicks
  import bool IsExitEnabled(int exit);
  // Handles interaction with particular room exit
  import bool OnExit(int exit);
  
  
  // Maximal possible room exits per scene
  protected int Capacity;
  // Exit names
  protected String      Name[];
  // Exit visibility flags
  protected bool        IsVisible[];
  // Exit accessability flag
  protected bool        IsEnabled[];
  // Room Objects, corresponding to exits
  protected Object*     EObject[];
  // Room Hotspots, corresponding to exits
  protected Hotspot*    EHotspot[];
  // Room Characters, corresponding to exits
  protected Character*  EChar[];
  // Cursor mode to be used when delegating interaction to room object
  protected CursorMode  InterMode[];
};

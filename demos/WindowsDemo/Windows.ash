
// WindowStyle configures a window behavior
enum WindowStyle
{
    eWinStyleMoveable   = 0x0001, 
    eWinStyleSizeable   = 0x0002, 
    eWinStyleTopmost    = 0x0004
};

enum WindowSide
{
    eWinSideLeft        = 0, 
    eWinSideTop, 
    eWinSideRight, 
    eWinSideBottom
};

enum WindowAnchor
{
    eWinAnchorLeft      = 0x0001, 
    eWinAnchorTop       = 0x0002, 
    eWinAnchorRight     = 0x0004, 
    eWinAnchorBottom    = 0x0008, 
    eWinAnchorLeftRight = 0x0005, 
    eWinAnchorTopBottom = 0x000A, 
    eWinAnchorAll       = 0x000F
};

// Window object lets manage a single "window" GUI
managed struct Window
{
    import readonly attribute int ID;
    import attribute WindowStyle Style;
    import readonly attribute bool IsMoveable;
    import readonly attribute bool IsSizeable;
    import readonly attribute bool IsTopmost;
    import readonly attribute bool HasFocus;
    import attribute int MinWidth;
    import attribute int MaxWidth;
    import attribute int MinHeight;
    import attribute int MaxHeight;
    import attribute int Padding[]; // use WindowSide as index
    
    import void Focus();
    import void MoveToTop();
    import void UpdateLayout();
    
    // Private fields
    protected int   _id;
    protected WindowStyle _style;
    protected int   _minWidth;
    protected int   _minHeight;
    protected int   _maxWidth;
    protected int   _maxHeight;
    protected bool  _hasFocus;
    protected int   _zsortPos;
    protected int   _padding[4];
    protected int   _lastLayoutWidth;
    protected int   _lastLayoutHeight;
    protected bool  _enableLayout;
};

// Windows struct provides methods for setting up and controlling
// the overall state and behavior of the windows system.
struct Windows
{
    import static readonly attribute int WindowCount;
    import static Window*[] GetWindows();
    import static void UpdateAllWindowLayouts();
    import static attribute int TopZOrder;
    import static attribute int BorderWidth;
    import static attribute int CaptionHeight;
    import static attribute int NormalCursor;
    import static attribute int DragCursor;
    import static attribute int ResizeHorizontalCursor;
    import static attribute int ResizeVerticalCursor;
    import static attribute int ResizeTLBRCursor;
    import static attribute int ResizeTRBLCursor;
};

//
// GUI extender functions, connect GUI object to a Window system
//---------------------------------------------------------------

/// Adds this GUI to the window system. When a GUI is a part of the system, 
/// all the system actions, such as dragging and resizing a window will apply to it.
import void AddToWindows(this GUI*, WindowStyle style);
/// Removes this GUI from the window system.
import void RemoveFromWindows(this GUI*);
/// Gets a Window object, associated with this GUI. Returns null if GUI is not
/// a part of the windows system.
import Window* GetWindow(this GUI*);

//
// GUI control extender functions
//---------------------------------------------------------------

import void SetAnchor(this GUIControl*, WindowAnchor anchor);

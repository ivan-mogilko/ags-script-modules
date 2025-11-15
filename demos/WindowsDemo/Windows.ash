
// WindowStyle configures a window behavior
enum WindowStyle
{
    eWinStyleMoveable   = 0x0001, 
    eWinStyleSizeable   = 0x0002, 
    eWinStyleTopmost    = 0x0004
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
    
    import void Focus();
    import void MoveToTop();
    
    // Private fields
    protected int   _id;
    protected WindowStyle _style;
    protected int   _minWidth;
    protected int   _minHeight;
    protected int   _maxWidth;
    protected int   _maxHeight;
    protected bool  _hasFocus;
    protected int   _zsortPos;
};

// Windows struct provides methods for setting up and controlling
// the overall state and behavior of the windows system.
struct Windows
{
    import static readonly attribute int WindowCount;
    import static Window*[] GetWindows();
    import static attribute int TopZOrder;
    import static attribute int BorderWidth;
    import static attribute int CaptionHeight;
    import static attribute int NormalCursor;
    import static attribute int DragCursor;
    import static attribute int ResizeHorizontalCursor;
    import static attribute int ResizeVerticalCursor;
    import static attribute int ResizeDiagonalCursor;
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

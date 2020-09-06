//////////////////////////////////////////////////////////////////////////////////////////
//
// CustomInventoryWindow module
//
// Author: Ivan K. Mogilko
// Last revision: 2015
//
// A customly drawn inventory with few extra features added in comparison to default AGS
// inventory.
//
//////////////////////////////////////////////////////////////////////////////////////////

struct CustomInventoryWindow extends CustomInventory
{
  // Set up arrangement of items inside the inventory grid
  import void          SetItemArrangement(int col_total, int row_total, bool is_row_based);
  // Set up inventory window parameters
  import void          SetWindow(int x, int y, int width, int height, int itemWidth, int itemHeight, int hsep, int vsep);
  // Add item to custom inventory
  import void          AddItemToWnd(InventoryItem *item);
  // Remove item from custom inventory
  import void          RemoveItemFromWnd(InventoryItem *item);
  
  // Resets the window view to display the top-left cell of the inventory
  import void          ResetToTopLeft();
  // Set first visible row; returns the new topmost row
  import int           SetFirstVisibleRow(int row);
  // Set first visible column; returns the new leftmost column
  import int           SetFirstVisibleColumn(int column);
  
  // Gets inventory item at given point, or null; coordinates are inventory-related
  import InventoryItem* GetItemAtPoint(int x, int y);
  // Gets inventory item at given row and column, or null; countVisibleOnly parameter
  // specifies whether coordinates are related to top-left visible slot, or the absolute
  // top-left slot of the inventory
  import InventoryItem* GetItemAtSlot(int row, int column, bool countVisibleOnly);
  
  // Draws the inventory on given drawing surface
  import void          Draw(DrawingSurface * ds);
  
  
  // The flag that indicates whether inventory window has changes that are not yet drawn
  writeprotected bool ShouldRedraw;
  
  // Inventory window position
  protected int X;
  protected int Y;
  protected int Width;
  protected int Height;
  // Item metrics
  protected int ItemWidth;
  protected int ItemHeight;
  // Spacing between items
  protected int HorSeparator;
  protected int VerSeparator;
  
  // Total rows and columns in the inventory;
  // -1 is unlimited; it is recommended that only one dimension is made unlimited (or none)
  protected int ItemRowsTotal;
  protected int ItemColumnsTotal;
  // Indexing mode; if row-based, items will be arranged by rows (column index is base index),
  // otherwise they will be arranged by columns (row index is base index)
  protected bool IsRowBased;
  // !!!WARNING!!! not yet implemented !!!TODO!!!
  
  // !!!TODO!!! group items with quantity (yes/no)
  
  // Number of visible rows and columns
  protected int ItemRowsVisible;
  protected int ItemColumnsVisible;
  // Absolute indices of the topmost row and leftmost column visible
  protected int FirstRowVisible;
  protected int FirstColumnVisible;
  // Absolute indices of the bottom row and rightmost column visible
  protected int LastRowVisible;
  protected int LastColumnVisible;
};

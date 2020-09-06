//////////////////////////////////////////////////////////////////////////////////////////
//
// CustomInventory module
//
// Author: Ivan K. Mogilko
// Last revision: 2015
//
// A custom inventory for saving items in the list.
// As opposed to built-in AGS inventory, keeps items in the order of acquirement.
//
//////////////////////////////////////////////////////////////////////////////////////////

struct CustomInventory
{
  // Set up custom inventory, providing character reference and maximal size of storage
  import void          SetSource(Character *char_, int size);
  // Add item to custom inventory
  import void          AddItem(InventoryItem *item);
  // Remove item from custom inventory
  import void          RemoveItem(InventoryItem *item);
  
  // Item array
  writeprotected InventoryItem *Items[MAX_INV];
  // Array capacity and actual item count
  writeprotected int           Size;
  writeprotected int           ItemCount;
  // Owner of the inventory
  writeprotected Character *   Owner;
};

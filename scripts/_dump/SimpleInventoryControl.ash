//////////////////////////////////////////////////////////////////////////////////////////
//
// SimpleInventoryControl module
//
// Author: Ivan K. Mogilko
// Last revision: 2015
//
// A simplistic control for CustomInventoryWindow, having two buttons to switch between
// pages of items.
//
//////////////////////////////////////////////////////////////////////////////////////////

struct SimpleInventoryControl extends CustomInventoryWindow
{
  import void EnableControl(bool enable);
  import void OnPrevButton();
  import void OnNextButton();
  
  Button *PrevPageBtn;
  Button *NextPageBtn;
};

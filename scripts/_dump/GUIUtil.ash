//////////////////////////////////////////////////////////////////////////////////////////
//
// GUIUtil module
//
// Author: Ivan K. Mogilko
// Last revision: 2016
//
// GUI related utility types and functions
//
//////////////////////////////////////////////////////////////////////////////////////////

#define SPRITE_MASK_CACHE_SIZE	64
struct SpriteMaskCache
{
	import static int						 CacheSprite(int num);
	import static DynamicSprite *CacheAndGetSprite(int num);
	import static DynamicSprite *GetCachedSprite(int cache_slot);
	import static void					 Clear();
	import static void					 FreeSprite(int cache_slot);
};

struct PixelPerfectDetection
{
  import static GUIControl *GetGUIControl(GUI *gui, int x, int y, bool test_clickable);
};

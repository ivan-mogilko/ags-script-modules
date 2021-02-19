
struct WallOfText
{
    import static void Show(String text, int font, int x, int y, int w, int h);
    import static void Hide();
    
    import static void Redraw();
};

struct TitledWallOfText
{
    import static void Show(String title, String text, int title_font, int text_font, int x, int y, int w, int h, int bg_col = 0);
    import static void Hide();
    
    import static void Redraw();
};

struct HintGUI
{
    import static void Show(String text, int font, int x, int y, int w, int h, int bg_col = 0);
    import static void Hide();
};

struct PauseGUI
{
    import static void Show(String text, int x, int y, int w, int h, int bg_col = 0);
    import static void Hide();
};

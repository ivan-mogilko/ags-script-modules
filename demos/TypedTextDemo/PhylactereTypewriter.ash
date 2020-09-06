//
// Speech bubble drawing on surface.
// Drawing algorithm "borrowed" from the Phylactere 2.33 script module,
// original copyright (C) 2009  Asraroth.
//

#ifndef Phylactere_VERSION
enum PhylactereQueueMode {
  ePhylactereThinking, 
  ePhylactereTalking
};
#endif

// Draw Phylactere on the given surface
import void DrawPhylactere(DrawingSurface *ds, int at_x, int at_y, int bubble_width, int bubble_height,
                           int dir_loop, PhylactereQueueMode Mode = ePhylactereTalking);

#ifndef Phylactere_VERSION
struct Phylactere_Param{
  int background_color;          // couleur de fond de la bulle (non transparente)
  int outline_color;             // couleur du contour de la bulle
};

import Phylactere_Param phylactere;
#endif // !Phylactere_VERSION

// Display typewriter in the form of character's phylactere speech
import void PhylactereTypewriter(this Character*, String text, BlockingStyle bs, int delay);
import bool IsPhylactereStillTyping();
import void InterruptPhylactereTypewriter();

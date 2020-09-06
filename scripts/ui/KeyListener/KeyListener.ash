// KeyListener is open source under the MIT License.
//
// TERMS OF USE - KeyListener MODULE
//
// Copyright (c) 2016-present Ivan Mogilko
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of
// this software and associated documentation files (the "Software"), to deal in
// the Software without restriction, including without limitation the rights to
// use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
// the Software, and to permit persons to whom the Software is furnished to do so,
// subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
// FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
// IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#ifndef __KEY_LISTENER_MODULE__
#define __KEY_LISTENER_MODULE__

#define KEY_LISTENER_VERSION_00_00_09_07

// Comment this line out to completely disable KeyListener during compilation
#define ENABLE_KEY_LISTENER

#ifdef ENABLE_KEY_LISTENER

// Uncomment this to enable debug messages (for testing purposes only)
//#define KEY_LISTENER_DEBUG

// Maximal supported number of keys to listen at the same time.
// Feel free to increase or decrease this for your project in relation to your needs.
// Remember, that more keys the listener tracks at the same time, the slower it works.
// Keep an eye on your game speed if you change this; but usually it should not affect
// your game much, because the key state processing is a simple task.
#define KEY_LISTENER_MAX_KEYS 32

// Default KeyListener settings.
// These values are declared here mainly for the reference. It is not recommended
// to change these; configure KeyListener by setting corresponding class properties
// instead (see class declaration below).
// All these values are in milliseconds.
//
// A time that has to pass before the held down key is considered "repeating"
#define KEY_LISTENER_DEFAULT_AUTO_REPEAT_DELAY     300
// A time that has to pass between each "repeating" key command
#define KEY_LISTENER_DEFAULT_AUTO_REPEAT_PERIOD    40
// A maximal time passed between two key taps while they still considered a sequence
#define KEY_LISTENER_DEFAULT_SEQUENCE_TIMEOUT      300


struct KeyListener
{
  ///////////////////////////////////////////////////////////////////////////
  //
  // Setting up
  // ------------------------------------------------------------------------
  // Functions and properties meant to configure the listener's behavior.
  //
  ///////////////////////////////////////////////////////////////////////////
  
  /// Enables or disables KeyListener, without cancelling tracked keys settings
  import static attribute bool Enabled;
  
  /// Commences or ceases to listen keycode
  import static void ListenKey(eKeyCode keycode, bool enable = true);
  import static void ListenMouse(bool enable = true);
  /// Stops listening all keycodes
  import static void StopListenAllKeys();
  
  /// Resets all listener parameters to default values
  import static void ResetToDefaults();
  
  /// Get/set minimal time (in milliseconds) for a held down key to be down to be considered "repeating"
  import static attribute int KeyAutoRepeatDelay;
  /// Get/set period (in milliseconds) between each "repeating" key count
  import static attribute int KeyAutoRepeatPeriod;
  /// Get/set maximal period (in milliseconds) between two key taps while they still considered a sequence
  import static attribute int KeySequenceTimeout;
  
  
  ///////////////////////////////////////////////////////////////////////////
  //
  // Event signals
  // ------------------------------------------------------------------------
  // Properties meant to signal user about keys events.
  //
  ///////////////////////////////////////////////////////////////////////////

  /// Gets if key was just pushed
  readonly import static attribute bool EvtKeyPushed[];
  readonly import static attribute bool EvtMousePushed[];
  /// Gets if key was just released after being held down
  readonly import static attribute bool EvtKeyReleased[];
  readonly import static attribute bool EvtMouseReleased[];
  /// Gets if key command was repeated for a held down key
  readonly import static attribute bool EvtKeyAutoRepeated[];
  readonly import static attribute bool EvtMouseAutoRepeated[];
  /// Gets if key was tapped another time in sequence
  readonly import static attribute bool EvtKeySequenced[];
  readonly import static attribute bool EvtMouseSequenced[];
  /// Gets if key was tapped twice in sequence just now
  readonly import static attribute bool EvtKeyDoubleTap[];
  readonly import static attribute bool EvtMouseDoubleClick[];
  
  
  ///////////////////////////////////////////////////////////////////////////
  //
  // Key records
  // ------------------------------------------------------------------------
  // Properties meant to tell gathered information about keys the listener
  // is listening to.
  //
  ///////////////////////////////////////////////////////////////////////////

  /// Gets if key is currently held down
  readonly import static attribute bool IsKeyDown[];
  readonly import static attribute bool IsMouseDown[];
  /// Gets how many times the pressed down key command was repeated
  readonly import static attribute int  KeyAutoRepeatCount[];
  readonly import static attribute int  MouseAutoRepeatCount[];
  /// Gets how many times the key was tapped in sequence
  readonly import static attribute int  KeySequenceLength[];
  readonly import static attribute int  MouseSequenceLength[];
  /// Gets how long (in milliseconds) the key was not pressed
  readonly import static attribute int  KeyUpTime[];
  readonly import static attribute int  MouseUpTime[];
  /// Gets how long (in milliseconds) the key was held down
  readonly import static attribute int  KeyDownTime[];
  readonly import static attribute int  MouseDownTime[];
};

#endif  // ENABLE_KEY_LISTENER

#endif  // __KEY_LISTENER_MODULE__

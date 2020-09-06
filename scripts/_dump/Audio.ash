//
// Module: Audio
// Author: Ivan Mogilko
//

struct Audio
{
  import static function SetMasterVolume(int volume);
  import static function SetMusicVolume(int volume);
  import static function SetSoundFXVolume(int volume);
  import static function SetVoiceVolume(int volume);
  
  import static int GetMasterVolume();
  import static int GetMusicVolume();
  import static int GetSoundFXVolume();
  import static int GetVoiceVolume();
};

import AudioChannel * GetPlayingInstance(this AudioClip*, int seekFrom = 0);
import function PlayContinious(this AudioClip*, AudioPriority = eAudioPriorityNormal, RepeatStyle = eRepeat);
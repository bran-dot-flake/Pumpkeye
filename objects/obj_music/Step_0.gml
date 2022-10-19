
if die and audio_sound_get_gain(now_playing) == 0
{
	// Clear the song
	 audio_stop_sound(now_playing);
	 
	 die = false;
}
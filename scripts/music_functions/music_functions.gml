
function play_song(_song, _loops)
{
	with obj_music if now_playing != _song
	{
		var vol = global.save_data.mus_volume 
				* global.save_data.master_volume;
		
		
		// Stop the old song, fade out
		previous_track = now_playing;
		audio_sound_gain(previous_track, 0 , time);
		
		// Play the new, fade in
		now_playing = audio_play_sound(_song, 1, _loops, 0);
		audio_sound_gain(now_playing, vol, 500);
	}
}



function stop_song()
{
	with obj_music 
	{	
		audio_sound_gain(now_playing, 0, time);
		die = true;
	}
}



///@desc Set gain of music by scalar
///			Use numbers 0-1
function set_song_volume(_multiplier)
{
	with obj_music
	{
		var vol_max		= global.save_data.mus_volume 
						* global.save_data.master_volume;
		var vol_from	= now_playing != noone ? audio_sound_get_gain(now_playing): 0;
		var vol_to		= vol_from * _multiplier;
		
		
		// Clamp
		vol_to = clamp(vol_to, 0, vol_max);
	
	
		// Set new volume
		if now_playing		!= noone audio_sound_gain(now_playing, vol_to, time);
	}
}



function play_sfx(_sfx) {
	return audio_play_sound(_sfx, 2, 0, 
			global.save_data.master_volume * global.save_data.sfx_volume);
}
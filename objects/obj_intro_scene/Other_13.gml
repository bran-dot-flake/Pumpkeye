///@desc Outro

if palette_fade_end() 
{	
	// Wait
	state = intro_states.wait
	timer[1] = time[intro_times.in_between];
	
	// New page
	page++
	count = 0;
	palette_fade(transition_type.intro);
			
			
	// Destroy if theres no more data
	if page > array_length(text) - 1 or page > sprite_get_number(global.sprites.intro_scene) - 1 {
		transition("next");	
		instance_destroy();
	}
}
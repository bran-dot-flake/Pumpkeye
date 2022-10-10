///@desc Wait

if timer[1] <= 0 
{
	state = intro_states.play;
	
	global.palette_index = sprite_get_width(global.sprites.palette)
	palette_fade(transition_type.intro);
}

event_inherited();


// Variables
timer	= 0;
time	= global.defaults.transition_time;
frames	= 0;


// Methods
function initialize()
{
	//with obj_application_surface {
	//	target_palette_index = _type == transition_type.outro ? sprite_get_width(global.sprites.palette) - 1 : 1;	
	//	_speed = _type == transition_type.outro ? global.defaults.intro_palette_speed[1] : 	global.defaults.intro_palette_speed[0];
	//}
	//palette_fade(type);
}

palette_fade(transition_type.intro);
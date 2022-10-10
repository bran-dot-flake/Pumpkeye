
event_inherited();


function initialize()
{
	image_speed = type == transition_type.intro ? 1 : -1;	
	image_index = type == transition_type.intro ? 0 : image_number - 1;
}

frames = 0;
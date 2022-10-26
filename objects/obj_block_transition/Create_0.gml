
event_inherited();


// Variables
timer	= 0;
time	= global.defaults.transition_time;
frames	= 0;


// Methods
function initialize()
{
	image_speed = type == transition_type.intro ? 1 : -1;	
	image_index = type == transition_type.intro ? 0 : image_number - 1;
}
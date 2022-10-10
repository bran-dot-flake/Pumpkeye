
surface			= surface_create(gw, gh);

type			= transition_type.intro;
radius			= 0;
target_radius	= 0;
count			= 0;
timer			= 0;
time			= 60;
_speed			= 20;
target_room		= noone;


function initialize()
{
	// Set opposite points
	target_radius = type == transition_type.intro ? 0 : gw;
	radius = abs(target_radius - gw);
}
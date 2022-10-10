
surface			= surface_create(gw, gh);

type			= 0;
radius			= 0;
target_radius	= 0;
count			= 0;
timer			= 0;
time			= 6;
_speed			= 2;


function initialize()
{
	// Set opposite points
	target_radius = type == transition_type.intro ? 0 : gw;
	radius = abs(target_radius - gw);
}


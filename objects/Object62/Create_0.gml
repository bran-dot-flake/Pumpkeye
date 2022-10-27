
current_x_speed = 0;
applied_x_speed = 0;
current_y_speed = 0;
applied_y_speed = 0;

ground_friction = .2;
ground_accel = .1;
gravity_		= .2;


x_input = 0;
x_fraction = 0;
y_fraction = 0;

walk_speed = 2;


function grounded() {
	return place_meeting(x, y + 1, par_solid);	
}
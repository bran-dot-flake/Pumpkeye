///@desc	Everything needed for basic movement so that it can be quickly used.
///			Gives	:	Calculating speed and applying speed
///			Does not:	Determine input



function set_speeds(_friction, _accel, _gravity, _walk_speed) {
	
	#region set variables
	current_x_speed = 0;
	applied_x_speed = 0;
	current_y_speed = 0;
	applied_y_speed = 0;

	ground_friction = _friction;
	ground_accel	= _accel;
	gravity_		= _gravity;


	x_input			= 0;
	x_fraction		= 0;
	y_fraction		= 0;

	walk_speed		= _walk_speed;	
	#endregion
	
}


function calculate_speeds() {

	#region acceleration
	current_x_speed = (x_input != 0)?approach(current_x_speed, walk_speed * sign(x_input), ground_accel):
									 approach(current_x_speed, 0, ground_friction);
	applied_x_speed = current_x_speed;


	if !grounded() applied_y_speed += gravity_;
	else applied_y_speed = 0;
	#endregion

	#region speed fractions
	if ((x_input == 0) && (current_x_speed == 0)){ x_fraction = 0;}

	// add back fractions
	applied_x_speed +=		x_fraction;
	applied_y_speed +=		y_fraction;

	// create fractions -- create leftover numbers for speed
	x_fraction		=		frac(applied_x_speed);
	y_fraction		=		frac(applied_y_speed);

	// convert to integers
	applied_x_speed	=		int64(applied_x_speed);
	applied_y_speed	=		int64(applied_y_speed);
	#endregion	
	
}


function apply_speeds() {
	
	#region collision and movement
	//x_speed_previous = current_x_speed;
	//y_speed_previous = current_y_speed;

	//var speed_ = move_with_collisions(par_solid, applied_x_speed, applied_y_speed);
	//applied_x_speed	= speed_[0]		// x speed
	//applied_y_speed	= speed_[1]		// y speed


	var spd = stop_with_object_collisions(applied_x_speed, applied_y_speed);

	x += spd[0];
	y += spd[1];
	#endregion	

}


function grounded() {
	return place_meeting(x, y + 1, par_solid);	
}
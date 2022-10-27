
x_input = ih(input.Right) - ih(input.Left);


#region Movement

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

#endregion
/// @desc move

#region change states
// idle
	if (round(state_switch_timer) == 0){
			// switch to idle after one second
		change_state(BOT_STATES.idle);
		state_switch_timer = SEC *1;
		event_user(state); exit;
	}
#endregion

#region acceleration
// movement, get rid of approach if static movement is desired
	// moves only at the end of animation even though state is one second, will happen a few times
if (animation_end()){ applied_x_speed = walk_speed;}
if (applied_x_speed != 0){ applied_x_speed = approach(applied_x_speed, 0, ground_friction);}


// stop movement (stops animation) when wall is hit
	if (wall_left || wall_right){
		current_x_speed = 0; 
		applied_x_speed = 0;
	}

// apply gravity
	current_y_speed = approach(current_y_speed, fall_speed, gravity_);
	applied_y_speed = current_y_speed;
#endregion

#region speed fractions
if ((x_input == 0) && (current_x_speed == 0)) {x_fraction = 0;}

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
x_speed_previous = current_x_speed;
y_speed_previous = current_y_speed;

var speed_ = move_with_collisions(par_solid, applied_x_speed, applied_y_speed);
applied_x_speed	= speed_[0];	// x speed
applied_y_speed	= speed_[1];	// y speed

x += applied_x_speed;
y += applied_y_speed;
#endregion

#region animation
image_speed = animation_speed;

frames_in_state++;
#endregion
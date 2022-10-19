///@desc land

#region change states
#region move state
if (x_input != 0 || frames_in_state >= 8){
	change_state(PLAYER_STATES.move);
	
	event_user(state);
	exit;
}
#endregion

#region jump state
if input_pressed(0, INPUT_ACTION.confirm){
	reset_input_buffer(INPUT_ACTION.confirm);
	change_state(PLAYER_STATES.jump);
		// larger jumps at max speed
	current_y_speed = (abs(current_x_speed) == walk_speed)?jump_speed - 0.5: jump_speed;
	on_ground = false;
	
	event_user(state);
	exit;
}

// fall off of ledge
if (!on_ground){
	change_state(PLAYER_STATES.jump);	
	
	event_user(state);
	exit;
}
#endregion

#region standing slash state
if (input_pressed(0, INPUT_ACTION.deny)){
	reset_input_buffer(INPUT_ACTION.deny);
	change_state(PLAYER_STATES.standing_slash);
	
	event_user(state);
	exit;
}
#endregion
#endregion

#region acceleration
current_x_speed = (x_input != 0)?approach(current_x_speed, walk_speed * sign(x_input), ground_accel):
								 approach(current_x_speed, 0, ground_friction);
applied_x_speed = current_x_speed;

// stop movement (stops animation) when wall is hit
if ( (wall_left  && sign(x_input == -1)) ||
	 (wall_right && sign(x_input ==  1)) ){
	current_x_speed = 0; 
	applied_x_speed = 0;
}
#endregion

#region speed fractions
if ((x_input == 0) && (current_x_speed == 0)) {x_fraction = 0;}
//if ((y_input == 0) && (current_y_speed == 0)) {y_fraction = 0;}		// player does not control speed

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
applied_x_speed	= speed_[0]		// x speed
applied_y_speed	= speed_[1]		// y speed

x += applied_x_speed;
y += applied_y_speed;
#endregion

#region animation
frames_in_state++;
#endregion
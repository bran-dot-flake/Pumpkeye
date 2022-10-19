///@desc jump

#region change states
// land state
	if (on_ground){
		change_state(PLAYER_STATES.landing);
		current_y_speed = 0;
		y_fraction = 0;
		event_user(state);
		exit;
	}
// jump slash
	if (input_pressed(0, INPUT_ACTION.deny)){
		reset_input_buffer(INPUT_ACTION.deny);
		change_state_ext(PLAYER_STATES.jumping_slash);
	}
#endregion

#region acceleration
// jumping in starting frames
if (frames_in_state <= 3 && current_y_speed > 0 && input_pressed(0, INPUT_ACTION.confirm)){
	reset_input_buffer(0);
	current_y_speed = jump_speed;
}

// stunt jumping (variable jumps)
if (!input_held(0, INPUT_ACTION.confirm) && current_y_speed <= -2) {current_y_speed *= 0.25;}

// X input
current_x_speed = (x_input != 0)?approach(current_x_speed, air_speed * sign(x_input), air_accel):
								 approach(current_x_speed, 0, air_friction);
applied_x_speed = current_x_speed;


// stop movement (stops animation) when wall is hit
if ( (wall_left  && sign(x_input == -1)) ||
	 (wall_right && sign(x_input ==  1)) ){
	current_x_speed = 0; 
	applied_x_speed = 0;
}

// apply gravity
current_y_speed = approach(current_y_speed, fall_speed, gravity_);
applied_y_speed = current_y_speed;
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
	// going up
if (current_y_speed < 0){
	manual_sprite_change = true;
	sprite_index = spr_link_duck_jump;
}
image_xscale = (facing_direction == DIR8.right)?abs(image_xscale): -abs(image_xscale);

frames_in_state++;
#endregion
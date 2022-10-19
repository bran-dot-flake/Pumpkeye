///@desc damaged

#region change state
// move (when flashing is done)
	if (flashing_timer == -1){
		if (global.CURRENT_SAVE_DATA.cur_hp <= 0){
			// death cutscene (later)
			instance_destroy(gui_object);
			instance_destroy(); exit;
		}
		change_state_ext(PLAYER_STATES.move);
	}
#endregion

#region acceleration
// stop movement (stops animation) when wall is hit
	if ( (wall_left  && sign(x_input == -1)) ||
		 (wall_right && sign(x_input ==  1)) ){
		current_x_speed = 0; applied_x_speed = 0;
	}

// apply gravity
	current_y_speed = approach(current_y_speed, fall_speed, gravity_);
	applied_y_speed = current_y_speed;
	
// x speed is constant; will continuously be applied regardless
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
applied_x_speed	= speed_[0];	// x speed
applied_y_speed	= speed_[1];	// y speed

x += applied_x_speed;
y += applied_y_speed;
#endregion

#region animation
// reset basic variables since not using change state function
	image_xscale = damaged_facing_direction;
	image_speed  = 0;
	image_index  = 0;
	frames_in_state++;
#endregion
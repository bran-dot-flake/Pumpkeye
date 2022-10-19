/// @desc move

#region change states
// throw
	if (frames_in_state >= SEC *0.4 && distance_to_player <= cs *6){
		change_state(MOLBLIN_STATES.throwing);
		var roll_ = random(1);
		if (roll_ <= 0.1){ spear_throws = 3;}
		else if (roll_ <= 0.23){ spear_throws = 2;}
		else{ spear_throws = 1;}
		event_user(state); exit;
	}
#endregion

#region acceleration
// x speed
	if (distance_to_player > cs *6){
		// when far, quickly move toward the player
		current_x_speed = approach(current_x_speed, walk_speed *direction_to_player, ground_accel *2);
		applied_x_speed = current_x_speed;
	} else if (distance_to_player != 0){
		// move if player is moving and not hurt, or stop if not
		current_x_speed = (obj_player_side.x_input != 0 && obj_player_side.state != PLAYER_STATES.damaged)?
		approach(current_x_speed, walk_speed *(sign(obj_player_side.x_input)), ground_accel):
		approach(current_x_speed, 0, ground_friction);
		applied_x_speed = current_x_speed;
	}

// shimmy when still
	if (current_x_speed = 0){
		var even_ = is_even(shimmy_timer div 64);	// 
		var step_ = (shimmy_timer mod 16 == 0);		// every 16 frames
		if (even_ and step_){ applied_x_speed = 1;}
		else if (!even_ and step_){ applied_x_speed = -1;}
	}

// apply gravity
	current_y_speed = approach(current_y_speed, fall_speed, gravity_);
	applied_y_speed = current_y_speed;
#endregion

#region speed fractions
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
var speed_ = move_with_collisions(par_solid, applied_x_speed, applied_y_speed);
applied_x_speed	= speed_[0];
applied_y_speed	= speed_[1];
x += applied_x_speed;
y += applied_y_speed;
#endregion

#region animation
image_speed  = animation_speed;

facing_direction = (direction_to_player > 0)?DIR8.right: DIR8.left;
image_xscale = direction_to_player;
frames_in_state++;
#endregion
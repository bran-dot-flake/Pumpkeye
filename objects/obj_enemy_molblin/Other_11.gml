///@desc throwing

#region change states
// restart throw state
	if (frames_in_state >= 32 && spear_throws > 0){
		change_state_ext(MOLBLIN_STATES.throwing);
	}
// move when done
	if (frames_in_state >= 39){
		change_state_ext(MOLBLIN_STATES.move);
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
image_speed  = 0;

// forward, back, forward, throw
if (frames_in_state <= 10){
	image_index = 0;
} else if (frames_in_state <= 20){
	image_index = 1;
} else if (frames_in_state < 23){
	image_index = 0;
} else{
	image_index = 2;
}

// create the spear on the 24th (23rd real, starts at 0) frame
if (frames_in_state == 23){
	var inst = instance_create_layer(x, y -18, LAY_FX, obj_moblin_projectile_spear);
	inst.direction = (direction_to_player > 0)?20: 160;
	inst.speed	   = 2.5;
	inst.image_xscale = direction_to_player;
	inst.gravity   = 0.075;
	inst.damage	   = damage;
	spear_throws--;
}

facing_direction = (direction_to_player > 0)?DIR8.right: DIR8.left;
image_xscale = direction_to_player;
frames_in_state++;
#endregion
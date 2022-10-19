///@desc wait

#region change states
// back to move
	if (current_x_speed == 0){
		state_switch_timer = SEC *1;
		var dir = (sign2(obj_player_side.x -x) == dir_);
		if (facing_direction == DIR8.right){
			facing_direction = (dir == true)?DIR8.right: DIR8.left;
		} else{
			facing_direction = (dir == true)?DIR8.left: DIR8.right;
		}
		change_state_ext(MOBLIN_STATES.move);
	}
#endregion

#region acceleration
// come to stop
	current_x_speed = approach(current_x_speed, 0, ground_friction/2);
	applied_x_speed = current_x_speed;

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
applied_x_speed	= speed_[0];	// x speed
applied_y_speed	= speed_[1];	// y speed

x += applied_x_speed;
y += applied_y_speed;
#endregion

#region animation
image_speed  = animation_speed;
image_xscale = dir_;

// move le spear
	if (!instance_exists(my_spear)){ instance_destroy(); exit;}
	if (image_index < 2){
		my_spear.x = x + 25 *dir_;
		my_spear.y = y - 20;
		my_spear.mask_index = spr_moblin_spear_projectile;		// update mask position every frame
	} else{
		my_spear.x = x + 13 *dir_;
		my_spear.y = y - 20;
		my_spear.mask_index = spr_moblin_spear_projectile;	
	}
	my_spear.image_xscale = image_xscale;

frames_in_state++;
#endregion
///@desc drop

#region change states
if (frames_in_state >= SEC *1 && y = y_level){
	change_state(DEELER_STATES.move);
	drop_down = true;
	state_switch_length = floor(random(SEC *6));
	current_y_speed = 0; applied_y_speed = 0;
	event_user(state); exit;
}
#endregion

#region acceleration
if (drop_down){
	current_y_speed = 2 *walk_speed;
	applied_y_speed = current_y_speed;
} else if (frames_in_state >= state_switch_length){
	current_y_speed = -walk_speed;
	applied_y_speed = current_y_speed;
} else{
	current_y_speed = 0;
	applied_y_speed = current_y_speed;	
}
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
image_yscale = 1;

// fix dropping to max height, and y to start
if (y-ystart >= 128 || on_ground){ 
	drop_down = false; 
	frames_in_state = 0;
	state_switch_length = floor(random(SEC *2));
}
if (y <= y_level){ y = y_level;}

// flip back and fourth to create a "walking" animation
if (frames_in_state mod 8 == 0){ image_xscale *= -1;} 

frames_in_state++;
#endregion
/// @desc move

#region change states
if (frames_in_state >= state_switch_length && distance_to_player <= 96){
	change_state(DEELER_STATES.drop);
	state_switch_length = floor(random(SEC *2));
	current_x_speed = 0; applied_x_speed = 0;
	event_user(state); exit;
}
#endregion

#region acceleration
if (distance_to_player > 2){
	// move toward the player
	current_x_speed = walk_speed * direction_to_player;
	applied_x_speed = current_x_speed;
} else {
	// stop
	current_x_speed = 0;
	applied_x_speed = current_x_speed;
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
image_yscale = -1;

// flip back and fourth to create a "walking" animation
if (frames_in_state mod 8 == 0){ image_xscale *= -1;} 

frames_in_state++;
#endregion
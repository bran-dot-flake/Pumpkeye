/// @desc idle

#region change states
// move
	if (round(state_switch_timer) == 0){
			// switch to move after random time, move slow or fast
		change_state(BIT_STATES.move);
		state_switch_timer = SEC *irandom_range(1, 12);
		walk_speed = choose(-walk_speed_slow, walk_speed_slow, -walk_speed_fast, walk_speed_fast);
		event_user(state); exit;
	}
#endregion

#region acceleration
	current_x_speed = 0;
	applied_x_speed = 0;
#endregion

#region speed fractions
	// no movement no collisions, ya dig
#endregion

#region collision and movement
#endregion

#region animation
image_speed = animation_speed;

frames_in_state++;
#endregion
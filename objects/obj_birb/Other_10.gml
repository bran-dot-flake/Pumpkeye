///@desc Idle


if instance_exists(obj_player) {
	// Get distance
	var dist = distance_to_object(obj_player);
	
	
	// Initialize face away
	if frames == 0 {
		facing = sign(x - obj_player.x);
		image_xscale = facing;
	}
	
	
	// Change state
	if dist <= 20 {
		change_state(birb_states.fly);
		facing = sign(x - obj_player.x);
		image_xscale = facing;	
	}
}

frames++;
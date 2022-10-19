///@desc Idle

// Move to player when in range, drop, come up --> idle/move
if instance_exists(obj_player) {
	
	// Change state
	if distance <= distances.drop change_state(spider_states.drop);
	else if distance <= distances.target
		x_speed = walk_speed * facing
		change_state(spider_states.move);
}
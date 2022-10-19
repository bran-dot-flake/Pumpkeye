///@desc Move

// Calculate Movement
if instance_exists(obj_player) {
	
	// Set speed;
	//x_speed = walk_speed * facing;
	
	
	// Drop
	if distance <= distances.drop {
		change_state(spider_states.drop);
		y_speed = 1;	
	}
}
else 
	change_state(spider_states.idle);


// General check for sides and such
move_with_tile_collisions(0)
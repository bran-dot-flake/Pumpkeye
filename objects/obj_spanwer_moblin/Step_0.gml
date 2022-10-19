/// @desc
/// spawn every time enemy dies, in the same spot

if (spawn_timer <= 0){
	spawn_timer	= round(SEC *random_range(3, 6));
	
	// camera is not at 0, and is less than the room width (minus the camera pos, so just room width)
	if ((cx != 0) && (cx < rw-cw)){
		// spawn at the edges of camera
		var inst = instance_create_layer(choose(cx, cx+cw), y, LAY_ENEMY, enemy_name);
		inst.facing_direction =	(inst.x == cx)?DIR8.right: DIR8.left;
		//inst.walk_speed		  = (inst.x == cx)?1: -1;
		inst.follow_player = false;
	}
}

if (spawn_timer > 0){ spawn_timer = approach(spawn_timer, 0, 1);}
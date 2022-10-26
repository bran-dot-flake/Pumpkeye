

if instance_exists(obj_player) {
	distance = abs(obj_player.x - x);
	facing  = sign(obj_player.x - x);
}


event_user(state);
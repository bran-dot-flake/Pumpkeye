///@desc Idle

y_offset = sin(frames / 5);

if instance_exists(obj_player) and distance_to_object(obj_player) < 16 {
	if place_meeting(x, y, obj_player) {
		change_state(key_states.follow);
		target = obj_player;
	}
}


frames++;
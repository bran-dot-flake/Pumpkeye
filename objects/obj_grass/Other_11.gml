///@desc Smush

if animation_end() image_speed = 0;


if instance_exists(obj_player) and !place_meeting(x, y, obj_player) {
	var d = abs(bbox_right - obj_player.bbox_right);
	
	
	if timer == 0 and  d > 12 timer = time + 1;
	if timer == 1 {
		//change_state(grass_states.idle);
		//image_speed = 1;
	}

}
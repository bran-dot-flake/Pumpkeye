///@desc Follow


if target != noone and instance_exists(target) {	
	// Open door
	if instance_exists(obj_door) and distance_to_object(instance_nearest(x, y, obj_door)) < 16 {
		// Door open
		var inst = instance_nearest(x, y, obj_door);
		inst.closed = false;
		
		
		// Reset target
		target = inst;
	}
	
	
	// Find target position
	if object_get_name(target) == object_get_name(obj_player) {
		// Set behind
		var spr_w = abs(target.bbox_right - target.bbox_left);
		var tpos = new vec2(target.x + target.facing * spr_w * -1, target.y - 5);
	}
	else {
		// Center
		var spr_w = abs(target.bbox_right - target.bbox_left);
		var spr_h = abs(target.bbox_top - target.bbox_bottom);
		
		var tpos = new vec2(target.x + spr_w / 2, target.y + 2 + spr_h / 2);
	}
	
	
	// Move
	x = lerp(x, tpos.x, .2);
	y = lerp(y, tpos.y, .2);
} else change_state(key_states.idle);

frames++;
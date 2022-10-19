
if target != noone {
	// Find target position
	var spr_w = abs(target.bbox_right - target.bbox_left);
	var tpos = new vec2(target.x + target.facing * spr_w * -1, target.y - 10);
	
	
	// Move
	x = lerp(x, tpos.x, .2);
	y = lerp(y, tpos.y, .2);
}
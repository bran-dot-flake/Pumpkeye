/// @description following

// basic camera
if (instance_exists(target_))
{
	/// calculate movement (center)
	var xx = (target_.x - view_width /2);
	var yy = (target_.y - view_height/2);
	
		// clamp
	if (instance_exists(obj_room_boundary))
	{
		// clamp to bbox of room boundary object
		var col_id = collision_point(x, y, obj_room_boundary, false, false);
		xx = clamp(xx, col_id.bbox_left, col_id.bbox_right - view_width +1);	// Plus one to accomodate where the borders are calculated
		yy = clamp(yy, col_id.bbox_top, col_id.bbox_bottom - view_height);
	} else 
	{
		// clamp to room size
		xx = clamp(xx, 0, room_width - view_width);
		yy = clamp(yy, 0, room_height - view_height);
	}
	
	// screen shake
	if (screen_shake_){
		xx += random_range(-screen_shake_amount, screen_shake_amount);	
		yy += random_range(-screen_shake_amount, screen_shake_amount);
	}
	
	/// apply movement
		// the object (sprite)
	x = xx;
	y = yy;
		// the actual camera
	camera_set_view_pos(c0, xx, yy);
}
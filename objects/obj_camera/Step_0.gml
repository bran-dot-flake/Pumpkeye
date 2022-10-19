
// Follow target
if target != noone {
	// Get the target's base position
	var tgx = (target.x div gw) * gw;
	var tgy = (target.y div gh) * gh;
	

	// Get the camera's base position
	var myx = (camera_get_view_x(camera) div gw) * gw;
	var myy = (camera_get_view_y(camera) div gh) * gh;

	
	// Change room shown
	if target.bbox_left >= myx + gw || target.bbox_right <= myx ||
	   target.bbox_top >= myy + gh || target.bbox_bottom <= myy {
		
		// Get target room direction
		var xoff = tgx - myx;
		var yoff = tgy - myy;
		
		
		// Clamp
		var tpos = new vec2(myx + xoff * gw, myy + yoff * gw);
		tpos.x = clamp(tpos.x, 0, room_width - gw);
		tpos.y = clamp(tpos.y, 0, room_height - gh);
		
		
		// Set camera
		camera_set_view_pos(camera, tpos.x, tpos.y);
		
		
		// Set new room variable
		global.current_screen.x = camera_get_view_x(camera);
		global.current_screen.y = camera_get_view_y(camera);
	}
}
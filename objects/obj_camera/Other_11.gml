/// @description free

/// calculate movement (same as follow just no target x)
x = clamp(x, 0, room_width - view_width);
y = clamp(y, 0, room_height - view_height);

/// apply movement
	// the actual camera
camera_set_view_pos(c0, x, y);
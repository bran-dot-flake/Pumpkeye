
timer = approach(timer, 0, 1);
image_alpha += fade_speed;

if image_alpha >= 1 {
	if timer == 0 timer = time;
	if timer == 1 {
		fade_speed *= -1;
		image_alpha = 1;
		
		// Next room
		if target_room == "next" room_goto_next()
		else if target_room != noone room_goto(target_room);
	}
}
if frames > 0 and image_alpha <= 0 {
	instance_destroy();
}

frames++;

// Timers
radius = approach(radius, target_radius, _speed);
timer = approach(timer, 0, 1);


// Set values after receiving variables
if count == 0 initialize();
count++;


// Next room / Delete
if radius == target_radius
{
	// Wait
	if type == transition_type.intro
	{
		if timer == 0 timer = time + 1;
		if timer == 1
		{	
			// Create outro
			instance_destroy();
			var inst = instance_create_depth(0, 0, 0, obj_square_transition);
			inst.type = transition_type.outro;	
			
			
			// Next room
			if target_room == "next" room_goto_next();
			else if target_room != noone room_goto(target_room);
			
		}
	}
	
	// End transition
	else instance_destroy();	

}

#region Initialize


if frames == 0 initialize();


#endregion


#region Timers


timer = approach(timer, 0, 1)
frames++;


#endregion


#region Transition End


// Animation over
if palette_fade_end() 
{
	// Wait
	if type == transition_type.intro
	{
		
		// Timer / Start outro
		if timer == 0 timer = time + 1;
		if timer == 1 
		{
			// Destroy intro
			instance_destroy();
			
			
			// Next room
			if target_room == "next" room_goto_next()
			else if target_room != noone room_goto(target_room)
			
			
			// Start outro
			var inst = instance_create_depth(0, 0, depths.gui, obj_palette_transition);
			inst.type = transition_type.outro;
		}
	}
	else instance_destroy();

}


#endregion
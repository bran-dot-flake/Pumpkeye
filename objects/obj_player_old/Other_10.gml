///@desc Move

#region Input
	
	get_input();	
	
#endregion


#region Pre-Calculations: Getting Defaults and State execution
	
	calculate_movement();
	
	calculate_animation();

#endregion


#region Check For Change

	//if frame_at(4) or frame_at(13) obj_particle_manager.dust(x,y, -facing);	

#endregion


#region Change State


// Jump
if jump and jumps > 0
{
	change_state(p_states.Jump);
	//input_reset_buffer(input.Confirm)
	y_speed = jump_speed;
	jumps--;
	grounded = false;
}


// Fall
if !grounded
	change_state(p_states.Jump)

// Idle
if x_speed == 0
	change_state(p_states.Idle);	


#endregion


#region Apply: Animation and Movement

	// Sprite
	apply_animation();

	// Movement
	move_with_collisions();

#endregion
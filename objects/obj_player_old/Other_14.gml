/// @desc Land

#region Input
	
	get_input();	
	
#endregion


#region Pre-Calculations: Getting Defaults and State execution
	
	calculate_movement();
	
	calculate_animation();

#endregion


#region Check For Change



#endregion


#region Change State


// Move
if x_input != 0 change_state(p_states.Move);

// Jump again
if jump and jumps > 0
{
	change_state(p_states.Jump);
	input_reset_buffer(input.Confirm)
	y_speed = jump_speed;
	jumps--;
	grounded = false;
}


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

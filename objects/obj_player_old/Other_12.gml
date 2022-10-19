///@desc Idle


#region Input
	
	get_input();	
	
#endregion


#region Pre-Calculations: Getting Defaults and State execution
	
	calculate_movement();
	
	calculate_animation();

#endregion


#region Check For Change
	
	manual_sprite_change = true;
	//
	//// Idle --> Bored
	//if sprite_index != spr_player_bored
	//{
	//	change_sprite(sprite[p_states.Idle]);
	//	
	//	// Bored
	//	//if frames_in_state >= SEC * 30 and floor(image_index) == 1
	//		//change_sprite(spr_player_bored);
	//}
	//
	//// Bored --> Idle
	//else
	//{
	//	if animation_end()
	//	{
	//		// Set Sprite
	//		change_sprite(sprite[p_states.Idle], 1);
	//		
	//		// Restart State
	//		frames_in_state = 0;
	//	}
	//}

#endregion


#region Change State

// Jump
if jump and jumps > 0
{
	change_state(p_states.Jump);
	input_reset_buffer(input.Confirm)
	jumps--;
	y_speed = jump_speed;
	grounded = false;
}

// Move
if x_input != 0
{
	change_state(p_states.Move);
}

#endregion


#region Apply: Animation and Movement

	// Sprite
	apply_animation();

	// Movement
	move_with_collisions();

#endregion
///@desc Jump

#region Input

	get_input();	
	
#endregion


#region Pre-Calculations: Getting Defaults and State execution
	
	calculate_movement();
	
	calculate_animation();

#endregion


#region Change State

if grounded and frames_in_state > 5
{
	//if x_speed == 0 change_state(p_states.Idle);
	//else change_state(p_states.Move);
	change_state(p_states.Land);
	squish = max_squish;
	//obj_particle_manager.dust_downward(x, bbox_bottom);
}

#endregion


#region Check For Change

image_index = sign(y_speed) == -1 ? 0 : 1; 

if !input_held(input.Confirm) and y_speed <= 0
{
	y_speed *= .8;
}


// 
if sign(y_speed)
{
	y_speed *= 1.05
}

#endregion


#region Apply: Animation and Movement

	// Sprite
	apply_animation();

	// Movement
	move_with_collisions();

#endregion
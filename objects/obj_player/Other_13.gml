///@desc Jump

get_input();

calculate_movement();

move_with_tile_collisions();


// Change state
if grounded and frames > 1
{
	var ste = x_input != 0 ? player_states.move : player_states.idle;
	change_state(ste);	
}

apply_animation();
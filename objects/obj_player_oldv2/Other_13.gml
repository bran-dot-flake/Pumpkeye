///@desc Jump

get_input();

calculate_movement();

//if !input_held(input.Confirm) and y_speed <= -2 y_speed *= .8


move_with_tile_collisions();


/// Animation	///
calculate_animation();

if sign(y_speed) change_sprite_state(player_states.jump_down, 0)



// Change state
if grounded and frames > 1
{
	player_land();
}

if coyote_timer > 0 and jump and jumps > 0 player_jump();

apply_animation();
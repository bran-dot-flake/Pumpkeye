///@desc Jump

get_input();

calculate_speeds();

if !input_held(input.Confirm) and applied_y_speed <= -2 applied_y_speed *= .8

apply_speeds();



/// Animation	///
calculate_animation();

if sign(current_y_speed) change_sprite_state(player_states.jump_down, 0)



// Change state
if grounded() and frames > 1
{
	player_land();
}

if coyote_timer > 0 and jump and jumps > 0 player_jump();

apply_animation();
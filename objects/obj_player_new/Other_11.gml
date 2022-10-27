///@desc Move

get_input();

calculate_speeds();

apply_speeds();

calculate_animation();



/// Change States

// Fall / Jump
player_fall();
if jump player_jump()


// Idle
else if x_input = 0 change_state(player_states.idle);


// SKid
if x_input != sign(current_x_speed) and x_input != 0 {
	change_state(player_states.skid);
}



/// Animation
if animation_end() foot_dust(x - facing * 6, y - 1, facing);


apply_animation();
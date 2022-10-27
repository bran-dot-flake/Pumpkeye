///@desc Idle

// Movement
calculate_movement();


move_with_tile_collisions();


calculate_animation();


// Input
get_input();


// State change
player_fall();

if jump player_jump();

else if x_input != 0 change_state(player_states.move);


apply_animation();
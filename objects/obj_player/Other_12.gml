///@desc Idle

// Movement
calculate_movement();

move_with_tile_collisions();


// Animation
if animation_end() image_speed = 0;


// Input
get_input();


// State change
if jump player_jump()
else if x_input != 0 change_state(player_states.move);


apply_animation();
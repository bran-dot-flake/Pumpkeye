///@desc Skid

get_input();

calculate_movement();

move_with_tile_collisions();

calculate_animation();


/// Change states
if x_speed != 0 and sign(x_speed) == x_input change_state(player_states.move)

if x_speed == 0 and x_input == 0 change_state(player_states.idle);


apply_animation();
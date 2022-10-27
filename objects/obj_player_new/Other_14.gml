///@desc Skid

get_input();

calculate_speeds();

apply_speeds();

calculate_animation();


/// Change states
if current_x_speed != 0 and sign(current_x_speed) == x_input change_state(player_states.move)

if current_x_speed == 0 and x_input == 0 change_state(player_states.idle);


apply_animation();
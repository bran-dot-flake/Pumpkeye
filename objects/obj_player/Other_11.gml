///@desc Move

get_input();

calculate_movement();

move_with_tile_collisions();



if jump player_jump()
else if x_input = 0 change_state(player_states.idle)

if animation_end() foot_dust(x - facing * 6, y - 1, facing)


apply_animation();
///@desc Born

// Set speed
image_speed = frames < 30 ? 0 : 1


// Change state
if animation_end() change_state(player_states.move);


apply_animation();
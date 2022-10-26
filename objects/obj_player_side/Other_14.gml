/// @desc stand slash

#region change states
var jump_cancel_frame = 13;
var move_cancel_frame = 13;
var duck_cancel_frame = 13;
var slash_frame_length = 60;
var slash_again_frame = 20;

// jump cancel
	if (input_pressed(0, INPUT_ACTION.confirm) && frames_in_state >= jump_cancel_frame){
		reset_input_buffer(INPUT_ACTION.confirm);
			// larger jumps at max speed
		current_y_speed = (abs(current_x_speed) == walk_speed)?jump_speed - 0.5: jump_speed;
		change_state(PLAYER_STATES.jump); event_user(state); exit;
	}
// fall off of ledge
	if (!on_ground){
		change_state(PLAYER_STATES.jump); event_user(state); exit;
	}
// move cancel
	if (x_input != 0 && frames_in_state >= move_cancel_frame){
		change_state(PLAYER_STATES.move); event_user(state); exit;
	}
// move at end of animation			(using frames rather than anim_end because there are only two images)
	if (x_input == 0 && frames_in_state >= slash_frame_length){
		change_state_ext(PLAYER_STATES.move);
	}
// duck cancel
	if (input_held(0, INPUT_ACTION.down) && frames_in_state >= duck_cancel_frame){
		change_state(PLAYER_STATES.duck); event_user(state); exit;
	}	
// slash again
	if (input_pressed(0, INPUT_ACTION.deny) && frames_in_state >= slash_again_frame){
		reset_input_buffer(INPUT_ACTION.deny);
		change_state_ext(PLAYER_STATES.standing_slash);
	}
#endregion

#region acceleration
// immediately stop (cannot enter state in air)
	x_fraction = 0;
	current_x_speed = 0;
	applied_x_speed = 0;
#endregion

#region speed fractions
#endregion

#region collision and movement
#endregion

#region animation
var hold_sprite = 0, attack_sprite = 1;

// hold back, attack, go to idle pose, hold back
if (frames_in_state >= 20){
	image_index = hold_sprite;	
} else if (frames_in_state >= 13){
	manual_sprite_change = true;
	sprite_index = sprite[PLAYER_STATES.move, facing_direction];
} else if (frames_in_state >= 7){
	image_index = attack_sprite;
	if (frames_in_state == 8) audio_play_sound(sfx_sword_slash, 1, false);
	
	// create hitbox every frame
	var instances = ds_list_create();
	var dir = (facing_direction == DIR8.right)?1: -1;
	var collisions;
	// split up because of the way draw event calculates pixels (need 1px offset diff)
	collisions = (facing_direction == DIR8.right)? 
		collision_rectangle_list(x +dir*10, y -21, x +dir*18, y -18, par_enemy, false, false, instances, false):
		collision_rectangle_list(x +dir*19, y -21, x +dir*11, y -18, par_enemy, false, false, instances, false);
	// deal damage
	for (var i = 0; i < collisions; i++){
		with instances[| i]{ 
			if !iframes take_damage(global.CURRENT_SAVE_DATA.attack_level +1); 
		}
	}
	ds_list_destroy(instances);
} else image_index = hold_sprite;
	
// sword beam at full health
if (global.CURRENT_SAVE_DATA.cur_hp == global.CURRENT_SAVE_DATA.maximum_hp){
	if (frames_in_state == 7 && !instance_exists(obj_sword_beam)){
		audio_play_sound(sfx_sword_laser_effect, 1, false);
		var inst = instance_create_layer(x, y -22, "inst_effects", obj_sword_beam);
		inst.beam_dir = dir_; inst.image_xscale = dir_;
	}
}

image_xscale = (facing_direction == DIR8.right)?1: -1;
frames_in_state++;
#endregion
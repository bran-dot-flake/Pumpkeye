/// @desc

#region pausing
if ( !transition_finished() || (instance_exists(obj_pause)) ){
	image_speed = 0;
	exit;
}
if (input_pressed(0, INPUT_ACTION.start)){
	instance_create_layer(-cs, -cs, "Instances", obj_pause);
	input_clear(0, INPUT_ACTION.start);		// only press pause once
	image_speed = 0;
	exit;
}
#endregion

#region check for ground
// tile based - corners
var t2 = tilemap_get_at_pixel(collision_tilemap, bbox_left, bbox_bottom);		//	bottom left
var t4 = tilemap_get_at_pixel(collision_tilemap, bbox_left, bbox_bottom + 1);	//	bottom left +1
var t1 = tilemap_get_at_pixel(collision_tilemap, bbox_right, bbox_bottom);		//	bottom right
var t3 = tilemap_get_at_pixel(collision_tilemap, bbox_right, bbox_bottom +1);	//	bottom right +1

// object based - bbox bottom +1
var t5 = collision_line(bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + 1,
						par_solid, false, false);
			   
on_ground =		(	(!any(t2, TILE_TYPE.platform) && any(t4, TILE_TYPE.solid, TILE_TYPE.platform, TILE_TYPE.ladder)) ||		// not in platform, bottom +1 is touching ground
					(!any(t1, TILE_TYPE.platform) && any(t3, TILE_TYPE.solid, TILE_TYPE.platform, TILE_TYPE.ladder)) ||
					((t1 == TILE_TYPE.ladder) && any(t3, TILE_TYPE.solid, TILE_TYPE.platform)) ||		// touching a ladder, bottom +1 is touching ground (walking through a lader)
					((t2 == TILE_TYPE.ladder) && any(t4, TILE_TYPE.solid, TILE_TYPE.platform)) ||
					(t5 != noone)					// object is touching bottom +1
				)&& (applied_y_speed == 0);			// could be going through platform
#endregion

#region check for wall
var wl = tile_meeting("collisions", x - 1, y, TILE_TYPE.solid);
var wr = tile_meeting("collisions", x + 1, y, TILE_TYPE.solid);

on_wall		= wl || wr;
wall_left	= wl;
wall_right	= wr;
#endregion

#region update direction
x_input		= (input_held(0, INPUT_ACTION.right) - input_held(0, INPUT_ACTION.left));
y_input		= (input_held(0, INPUT_ACTION.up)	 - input_held(0, INPUT_ACTION.down));

if (x_input | y_input != 0){
	var input_direction = point_direction(0, 0, x_input, y_input);	
		// divide into 8 directions
	target_direction	= round(input_direction / 45);
		// reset if makes full circle
	if (target_direction == 8) {target_direction = 0;}
	
		// only face left or right
	if (x_input != 0) {facing_direction = (x_input > 0)?DIR8.right: DIR8.left;}
}

dir_ = (facing_direction == DIR8.right)?1: -1;
#endregion

#region textbox interactables
#endregion

#region check for transition
if (y > 208){ y = 208;}

if (x < 0 || x > rw) && (transition_finished()){
	var inst = instance_place(x, y, obj_loading_zone);
	if (inst != noone){
		global.CURRENT_SAVE_DATA.enter_dir = inst.enter_dir;
		if (inst.audio_change != noone){ queue_new_song(inst.audio_change, 1, false);}
		fancy_transition(TRANS_MODE.goto, TRANS_TYPE.fade, TRANS_TYPE.fade, inst._target_room, deffa*2);
	} else{
		// default
		global.CURRENT_SAVE_DATA.enter_dir = noone;
		if (!audio_is_playing(mus_syrup_loop)){ queue_new_song(mus_syrup_loop, 1, 0, deffa);}
		fancy_transition(TRANS_MODE.goto, TRANS_TYPE.fade, TRANS_TYPE.fade, rm_overworld, deffa*2);	
	}
	exit;
}
#endregion

#region check for damage
if (iframes_timer == -1){
	var inst = instance_place(x, y, par_enemy);
	var inst_projectile = instance_place(x, y, par_enemy_projectile);
	// enemy check
		if (inst != noone){
			// take damage
				// lock hp to 0, must take at least 1 damage or the enemy's damage (minus the player's defense level)
			global.CURRENT_SAVE_DATA.cur_hp = max(0, global.CURRENT_SAVE_DATA.cur_hp - max(1, inst.damage - global.CURRENT_SAVE_DATA.health_level));
				// set timers
			iframes = true;
			iframes_timer = iframes_length;
			flashing_timer = flashing_length;
				// change state
			state = PLAYER_STATES.damaged;
			scr_screen_shake_(SEC *0.125);
				// reset basic variables, backwards movement, up
			x_fraction = 0;
			y_fraction = 0;
			var damage_dir = sign2(x -inst.x);
			current_x_speed = floor(walk_speed) * damage_dir;		// 1 px per frame movement
			applied_x_speed = floor(walk_speed) * damage_dir;
			current_y_speed = -fall_speed *0.5;				// move slightly up
			applied_y_speed = -fall_speed *0.5;
			damaged_facing_direction = damage_dir;
		}
	//projectile check
		if (inst_projectile != noone){
			// shield check
			var hit_height_dif = (y -inst_projectile.y);
			var hit_dir	   = sign2(inst_projectile.x -x);
			// jump has duck going up, will need to change
			if((any(state, PLAYER_STATES.move, PLAYER_STATES.standing_slash) && (hit_height_dif > 11))							||	// top shield
			   (any(state, PLAYER_STATES.duck, PLAYER_STATES.ducking_slash, PLAYER_STATES.landing) && (hit_height_dif <= 13))	||	// bot shield
			   (any(state, PLAYER_STATES.jumping_slash, PLAYER_STATES.jump) && current_y_speed > 0 && (hit_height_dif > 11))	||	// top when jumping
			   (any(state, PLAYER_STATES.jumping_slash, PLAYER_STATES.jump) && current_y_speed < 0 && (hit_height_dif <= 13))) && (hit_dir == dir_){		// bot shield when falling
				// slow and give taller angle
				inst_projectile.speed *= 0.25;
				inst_projectile.direction = (facing_direction == DIR8.right)?20: 160;
				// make sure is out of player hitbox and rid projectile hitbox
				inst_projectile.x += 4 *(dir_ *-1);
				inst_projectile.mask_index = spr_blank_hitbox;
				audio_play_sound(sfx_projectile_bounce_off_shield, 1, false);
			} else{
				// take damage
				global.CURRENT_SAVE_DATA.cur_hp = max(0, global.CURRENT_SAVE_DATA.cur_hp - max(1, inst_projectile.damage - global.CURRENT_SAVE_DATA.health_level));
					// set timers
				iframes = true;
				iframes_timer = iframes_length;
				flashing_timer = flashing_length;
					// change state
				state = PLAYER_STATES.damaged;
				scr_screen_shake_(SEC *0.125);
					// reset basic variables, move backwards movement, up
				x_fraction = 0;
				y_fraction = 0;
				// facing right, hit from the right, sends right instead of left, and faces right instead of left
				var damage_dir = sign2(x -inst_projectile.x);
				if (facing_direction == DIR8.right && inst_projectile.image_xscale == -1){
					damage_dir = -1;	
				} else if (facing_direction == DIR8.left && inst_projectile.image_xscale == 1){
					damage_dir = 1;	
				}
				current_x_speed = floor(walk_speed) * damage_dir;		// 1 px per frame movement
				applied_x_speed = floor(walk_speed) * damage_dir;
				current_y_speed = -fall_speed *0.5;				// move slightly up
				applied_y_speed = -fall_speed *0.5;
				damaged_facing_direction = damage_dir;
				
				if (inst_projectile.object_index != obj_moblin_held_spear){
					instance_destroy(inst_projectile);	
				}
			}
		}
}
#endregion

#region execute state, change sprite
manual_sprite_change = false;
event_user(state);

if (!manual_sprite_change && sprite[state, facing_direction] != noone){
	sprite_index = sprite[state, facing_direction];
}
#endregion

#region manage experience
if (global.CURRENT_SAVE_DATA.cur_exp != global.CURRENT_SAVE_DATA.target_exp){
	// move exp to target
	var amount = max(1, abs(round((global.CURRENT_SAVE_DATA.target_exp - global.CURRENT_SAVE_DATA.cur_exp) *0.1)));								// always positive percentage, will be greater than 1
	global.CURRENT_SAVE_DATA.cur_exp = approach(global.CURRENT_SAVE_DATA.cur_exp, clamp(global.CURRENT_SAVE_DATA.target_exp, 0, 9999), amount);	// move towards target exp, clamp to min and max

	// level up?
	if (global.CURRENT_SAVE_DATA.cur_exp >= global.CURRENT_SAVE_DATA.exp_to_next){
		if (obj_transitions_manager.state == TRANS_MODE.off){
			var inst = instance_create_layer(-500, -500, LAY_GUI, obj_level_up_menu);
		}
	}
}
#endregion

#region position clamp
// currently not needed because player walks off the side to transition rooms
#endregion

#region timers
if (iframes_timer != -1){
	iframes_timer = approach(iframes_timer, -1, 1);	
}
if (flashing_timer != -1){
	flashing_timer = approach(flashing_timer, -1, 1);
}

if (iframes_timer == 0) {iframes = false;}
#endregion
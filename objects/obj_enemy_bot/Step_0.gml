/// @desc

#region pausing
if ( !transition_finished() || (instance_exists(obj_pause)) ){
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
dir_ = (facing_direction == DIR8.right)?1: -1;
#endregion

#region check for damage
// stop execution of states when hit, so need to do timers here too 
if (iframes){
	if (round(iframes_timer) == 0){ iframes = false;}
	iframes_timer  = approach(iframes_timer,  -1, 1);
	flashing_timer = approach(flashing_timer, -1, 1);
	exit;
}
#endregion

#region jumping
/// jump
if (jump_timer <= 0 && on_ground && state != BOT_STATES.dead){
	if (instance_exists(obj_player_side)){ direction_to_player = sign2(obj_player_side.x - x);}	
	current_y_speed = jump_speed;
	on_ground = false;
	jump_timer = SEC *irandom_range(1, 12);
	change_state(BOT_STATES.jump);
}
#endregion

#region execute state, change sprite
manual_sprite_change = false;
event_user(state);

if (!manual_sprite_change && sprite[state, facing_direction] != noone){
	sprite_index = sprite[state, facing_direction];
}
#endregion

#region timers
// set timers back to -1 once activated
if (state_switch_timer != -1){
	state_switch_timer = approach(state_switch_timer, -1, 1);	
}
if (iframes_timer != -1){
	iframes_timer = approach(iframes_timer, -1, 1);	
}
if (flashing_timer != -1){
	flashing_timer = approach(flashing_timer, -1, 1);
}
jump_timer--;

// iframes is true when iframes timer active
if (iframes_timer == 0) {iframes = false;}
// reset palette pos once flashing is done
if (flashing_timer == -1){ pal_index = 0;}
#endregion
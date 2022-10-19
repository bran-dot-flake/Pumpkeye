/// @desc

#region distance, dir to player
if (instance_exists(obj_player_side)){
	distance_to_player  = abs(x -obj_player_side.x);
	direction_to_player = sign2(obj_player_side.x - x);
} else{
	image_speed = 0; exit;
}
#endregion

#region pausing
if (!transition_finished() || instance_exists(obj_pause) || distance_to_player >= 384){
	image_speed = 0; exit;
}
#endregion

#region check for ground
check_ground();
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

#region timers
// set timers back to -1 once activated
if (iframes_timer  != -1)	{iframes_timer  = approach(iframes_timer,  -1, 1);}
if (flashing_timer != -1)	{flashing_timer = approach(flashing_timer, -1, 1);}

if (flashing_timer == -1){ pal_index = 0;}
#endregion

#region damage check
// stop moving while iframes are active
if (iframes){
	if (round(iframes_timer) == 0){ iframes = false;}
}
#endregion

#region execute state, change sprite
manual_sprite_change = false; event_user(state);
if (!manual_sprite_change && sprite[state, facing_direction] != noone){
	sprite_index = sprite[state, facing_direction];
}
#endregion
function player_other_functions()
{



// State change
function change_state(_state)
{
	state			= _state;
	sprite_index	= sprite[_state]
	mask_index		= sprite[player_states.move]
	image_index		= 0;
	image_speed		= 1;
	frames			= 0;
		
	x_speed_frac	= 0;
	y_speed_frac	= 0;
}
	


// Sprite change
function change_sprite(_sprite)
{
	// Go to different sprite
	if sprite_index != _sprite
		image_index = 0;
	
	
	// Reset index
	sprite_index = _sprite;
}


// Ground check
function on_ground()
{
	var side = bbox_bottom;
	
	var t1 = tilemap_get_at_pixel(global.map, bbox_left, side + 1);
	var t2 = tilemap_get_at_pixel(global.map, bbox_right, side + 1);
	var t3 = tilemap_get_at_pixel(global.map, x, side + 1);
	
	return t1 != tile.none || t2 != tile.none || t3 != tile.none;
}


// Wall check
function on_wall()
{
	var side = facing == 1 ? bbox_right : bbox_left;
	var t1 = tilemap_get_at_pixel(global.map, side + facing, bbox_bottom);	
	var t2 = tilemap_get_at_pixel(global.map, side + facing, bbox_top);
		
	return t1 != tile.none || t2 != tile.none;
}


function player_jump()
{
	change_state(player_states.jump);
	y_speed = jump_speed;
	jumps--;
}

}
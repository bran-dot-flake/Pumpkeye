function player_other_functions()
{


// State change
function change_state(_state)
{
	state			= _state;
	
	change_sprite_state(_state, 1);
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



// Sprite with state index change
function change_sprite_state(_state, _reset_index = true)
{
	// Go to different sprite
	if sprite_index != sprite[_state, player_sprites.body] {
		// For indexing
		sprite_index	= sprite[_state, player_sprites.body];
		_sprite_index[player_sprite_index.hands]	= sprite[_state, player_sprites.hands];
		_sprite_index[player_sprite_index.head]		= sprite[_state, player_sprites.head_normal];
		_sprite_index[player_sprite_index.body]		= sprite[_state, player_sprites.body];
	
	
		if _reset_index image_index		= 0;
		image_speed		= 1;
	}
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

}
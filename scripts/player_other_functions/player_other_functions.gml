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
	


// Tile collision calculation and application
function move_with_tile_collisions()
{
	#region Integer Speeds
		
	// Apply fractions in next step
	x_speed += x_speed_frac;
	y_speed += y_speed_frac;
		
	// Turn speed into fractions
	x_speed_frac = x_speed - floor(abs(x_speed)) * sign(x_speed);
	y_speed_frac = y_speed - floor(abs(y_speed)) * sign(y_speed);
			
	// Take away speed from speed
	x_speed -= x_speed_frac;
	y_speed -= y_speed_frac;
			
	#endregion
	
	
	#region Horizontal Collisions
		
		
		#region Calculate Where To Check
		
			// Determine if Left or Right
			var side = x_speed > 0 ? bbox_right : bbox_left;
		
			// Top Right / Left
			var t1 = tilemap_get_at_pixel(global.map, side + x_speed, bbox_top);
		
			// Bottom Right / Left
			var t2 = tilemap_get_at_pixel(global.map, side + x_speed, bbox_bottom);
			
		#endregion
		
										
		#region Output Based on Data
			
			// Horizontal Collision Found: Move to Max
			if tilemap_get_at_pixel(global.map, x, bbox_bottom + 1)				> 1	t2 = 0;
			if tilemap_get_at_pixel(global.map, bbox_right, bbox_bottom + 1)	> 1 t2 = 0;
			if tilemap_get_at_pixel(global.map, bbox_left, bbox_bottom + 1)		> 1 t2 = 0;
				
			if t1 != tile.none || t2 != tile.none
			{
				if t1 == tile.solid || t2 == tile.solid
				{
					var x_to_side = side - x;
				
					// Right Collision
					if x_speed > 0
					{
						// Move back to neareast tile
						x -= x mod cs;
				
						// Move a full tile
						x += cs;
				
						// Move back half of bbox - 1 px offset
						x -= x_to_side + 1;
					}
				
					// Left Collision
					else
					{
						// Move back to neareast tile
						x -= x mod cs;
					
						// Move back half of bbox
						x -= x_to_side
					}
				
					// Stop
					x_speed = 0;
				}
			}
		
		#endregion
			
	#endregion
	
	
	#region Vertical Collisions
		
		
		#region Calculate Where To Check
		
			// Determine if Up or Down
			var side = y_speed > 0 ? bbox_bottom : bbox_top;
		
			// Top / Bottom Left
			var t1 = tilemap_get_at_pixel(global.map, bbox_left, side + y_speed);
		
			// Top / Bottom Right
			var t2 = tilemap_get_at_pixel(global.map, bbox_right, side + y_speed);
			
			// Botto, / Center
			var t3 = tilemap_get_at_pixel(global.map, x, side + y_speed);
			
		#endregion
		
										
		#region Output Based on Data
			
			// Vertical Collision Found: Move to Max
			if t1 != tile.none || t2 != tile.none || t3 != tile.none
			{
				if t1 == tile.solid || t2 == tile.solid || t3 == tile.solid
				{
					var y_to_side = side - y;
				
					// Bottom Collision
					if y_speed > 0
					{
						// Move back to neareast tile
						y -= y mod cs;
				
						// Move a full tile
						y += cs;
				
						// Move back half of bbox - 1 px offset
						y -= y_to_side + 1;
					}
				
					// Left Collision
					else
					{
						// Move back to neareast tile
						y -= y mod cs;
					
						// Move back half of bbox
						y -= y_to_side
					}
				
					// Stop
					y_speed = 0;
				}
			}
			
		#endregion
			
	
			
	#endregion		
		
	
	
	// Apply movement
	x += x_speed;
	y += y_speed;
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

// Tile collision calculation and application
function move_with_tile_collisions(_frac = true)
{
	if _frac calculate_speed_fractions();
	
	
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


function calculate_speed_fractions()
{
	//// Apply fractions in next step
	x_speed += x_speed_frac;
	y_speed += y_speed_frac;
		
	// Turn speed into fractions
	x_speed_frac = x_speed - floor(abs(x_speed)) * sign(x_speed);
	y_speed_frac = y_speed - floor(abs(y_speed)) * sign(y_speed);
			
	// Take away speed from speed
	x_speed -= x_speed_frac;
	y_speed -= y_speed_frac;
	
	
	// Frac reset
	//if x_speed == 0 x_speed_frac = 0;
}





function stop_with_object_collisions(_x_speed, _y_speed) {
	var obj = par_solid;
	
	// Down
	if(_y_speed > 0) { 
		// Horizontal
		if(place_meeting(x + _x_speed, y + _y_speed, obj)) {
			while(place_meeting(x + _x_speed, y, obj) && (_x_speed != 0)) { _x_speed = approach(_x_speed, 0, 1); }
			while(place_meeting(x + _x_speed, y + _y_speed, obj) && (_y_speed != 0)) { _y_speed = approach(_y_speed, 0, 1); }
		}
		
	// Up
	} else {
		// Horizontal
		if(place_meeting(x + _x_speed, y + _y_speed, obj)) {
			while(place_meeting(x, y + _y_speed, obj) && (_y_speed != 0)) { _y_speed = approach(_y_speed, 0, 1); }
			while(place_meeting(x + _x_speed, y + _y_speed, obj) && (_x_speed != 0)) { _x_speed = approach(_x_speed, 0, 1); }
		}
	}
	
	return [_x_speed, _y_speed];
}








///@func get_all_collisions(solid_object, x_speed, y_speed)
///@desc Detects collision objects and determines possible movement speeds for the calling object using its collision mask (note: MUST be pixel perfect)
///@arg collision_object
///@arg x_speed
///@arg y_speed
function get_all_collisions(_solid, _x_speed, _y_speed) {
	var tlay	= "ts_collisions";
	var tsol	= tile.solid;
	var tplat	= tile.platform;
	var tlad	= tile.ladder;
	
	
	#region Object testing
	if(_y_speed > 0) { //Going down
		//X movement preferred over Y (easier ledge landing)
		if(place_meeting(x + _x_speed, y + _y_speed, _solid)) {
			while(place_meeting(x + _x_speed, y, _solid) && (_x_speed != 0)) { _x_speed = approach(_x_speed, 0, 1); }
			while(place_meeting(x + _x_speed, y + _y_speed, _solid) && (_y_speed != 0)) { _y_speed = approach(_y_speed, 0, 1); }
			//The escape clause "(_x_speed != 0)" prevents infinite looping if you somehow clip into an object, but doesn't let you actually move, theoretically preventing clipping glitchs and preventing soft-locks (the player could still bring up a pause menu to restart for example)
		}
	} else { //Going up or staying flat
		//Y movement preferred over X (less likely to get "stuck on a ceiling" when jumping near a cliff, and gives an extra frame of "coyote time" when going over cliffs)
		if(place_meeting(x + _x_speed, y + _y_speed, _solid)) {
			while(place_meeting(x, y + _y_speed, _solid) && (_y_speed != 0)) { _y_speed = approach(_y_speed, 0, 1); }
			while(place_meeting(x + _x_speed, y + _y_speed, _solid) && (_x_speed != 0)) { _x_speed = approach(_x_speed, 0, 1); }
		}
	}
	#endregion

	#region Tile testing
	if(_y_speed > 0) { //Going down
	#region X Over Y
	//Landing on a solid
	if(tile_meeting(tlay, x + _x_speed, y + _y_speed, tsol)) {
		while(tile_meeting(tlay, x + _x_speed, y, tsol) && (_x_speed != 0)) { _x_speed = approach(_x_speed, 0, 1); }
		while(tile_meeting(tlay, x + _x_speed, y + _y_speed, tsol) && (_y_speed != 0)) { _y_speed = approach(_y_speed, 0, 1); }
	}
	//Landing on a platform
	if(tile_meeting(tlay, x + _x_speed, y + _y_speed, tplat) && !tile_meeting(tlay, x, y, tplat)) {
		while(tile_meeting(tlay, x + _x_speed, y + _y_speed, tplat) && (_y_speed != 0)) { _y_speed = approach(_y_speed, 0, 1); }
	}
	//Landing on a ladder, basically platform again
	if(tile_meeting(tlay, x + _x_speed, y + _y_speed, tlad) && !tile_meeting(tlay, x, y, tlad)) {
		while(tile_meeting(tlay, x + _x_speed, y + _y_speed, tlad) && (_y_speed != 0)) { _y_speed = approach(_y_speed, 0, 1); }
	}
	#endregion
	} else { //Going up or standing still
	#region Y Over X
	if(tile_meeting(tlay, x + _x_speed, y + _y_speed, tsol)) {
		while(tile_meeting(tlay, x, y + _y_speed, tsol) && (_y_speed != 0)) { _y_speed = approach(_y_speed, 0, 1); }
		while(tile_meeting(tlay, x + _x_speed,y + _y_speed, tsol) && (_x_speed != 0)) { _x_speed = approach(_x_speed, 0, 1); }
	}
	#endregion
	}
	#endregion
	
	return [_x_speed,_y_speed];
}
/*

#region Enums

enum p_states {
	Move,
	Jump,
	Idle,
	Pause,
	Land,
	Slide,
	Height
};

#endregion

#region Object variables


// Speeds
max_x_speed		= 2;
max_y_speed		= 8;
jump_speed		= -4.5;
walk_speed		= .5;
deccel			= 0.12;

x_speed			= 0;
y_speed			= 0;
x_speed_frac	= 0;
y_speed_frac	= 0;


// Movement
grounded		= 0;
walled			= 0;
max_jumps		= 1;
jumps			= max_jumps;
manual_speed_change = false;

// Animation
facing			= 1;
manual_sprite_change = false;
max_squish		= -0.5;
squish			= 0;


// States
state			= p_states.Move;
frames_in_state = 0;


// Input
attack			= 0;
jump			= 0;
x_input			= 0;
y_input			= 0;


#endregion

#region Sprite lookup table

sprite[p_states.Move]	= spr_pumpkin_walk;
sprite[p_states.Pause]	= spr_pumpkin_walk;
sprite[p_states.Idle]	= spr_pumpkin_walk;
sprite[p_states.Jump]	= spr_pumpkin_walk;
sprite[p_states.Land]	= spr_pumpkin_walk;


///@arg sprite
function debug_replace_player_sprites()
{
	//var i = 0; repeat p_states.Height{sprite[i] = argument0; i++};
}
//debug_replace_player_sprites(spr_blockhead)


#endregion

#region Initialize

//camera_set_target(id, cam_speed.Fast);

#endregion

#region Methods

	#region Core State Calculation
	
	function get_input()
	{
		if !manual_speed_change
		{
			x_input		= input_held(input.Right) - input_held(input.Left);
			y_input		= input_held(input.Down)  - input_held(input.Up);
		
			jump		= input_pressed(input.Confirm);
			attack		= input_pressed(input.Deny);
		}
	}
	
	
	function calculate_movement()
	{
		// Horizontal and Vertical Movement
		x_speed += x_input * walk_speed
		y_speed += global.grav;
		
		// Deccel
		x_speed = approach(x_speed, 0, deccel);
		
		// Stop
		if abs(x_speed) <= 0.1 x_speed = 0
		
		// Facing (by speed not input)
		if x_speed != 0 facing = sign(x_speed);	
		
		// Limit Speed
		x_speed = min(abs(x_speed), max_x_speed) * facing;
		y_speed = min(abs(y_speed), max_y_speed) * sign(y_speed);
		
		// Grounded and Walled
		grounded = on_ground();
		if grounded
			jumps = max_jumps;
		
		walled = on_wall();
	}
	
	
	function calculate_animation()
	{
		manual_sprite_change = false;
		frames_in_state++;
		mask_index = sprite[p_states.Idle];
	}
	
	
	function apply_animation()
	{
		// General sprite
		if !manual_sprite_change
			sprite_index = sprite[state];
		
		// Facing
		image_xscale = -facing;
		
	}
	
	#endregion
	
	#region Other
	
	function change_state(_state)
	{
		state = _state;
		image_index = 0;
		frames_in_state = 0;
		
		x_speed_frac = 0;
		y_speed_frac = 0;
	}
	
	
	function change_sprite(_sprite)
	{
		if sprite_index != _sprite
			image_index = 0;
		
		sprite_index = _sprite;
	}
	
	
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
			
			#endregion
		
										
			#region Output Based on Data
			
				// Vertical Collision Found: Move to Max
				if t1 != tile.none || t2 != tile.none
				{
					if t1 == tile.solid || t2 == tile.solid
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
		
		
		x += x_speed;
		y += y_speed;
	}
	
	
	function move_with_collisions()
	{
		move_with_tile_collisions();	
	}
	
	
	function on_ground()
	{
		var side = bbox_bottom;
		var t1 = tilemap_get_at_pixel(global.map, bbox_left, side + 1);
		var t2 = tilemap_get_at_pixel(global.map, bbox_right, side + 1);
		
		return t1 != tile.none || t2 != tile.none //inside_floor(global.map, x, bbox_bottom) >= 0;
	}
	
	function on_wall()
	{
		var side = facing == 1 ? bbox_right : bbox_left;
		var t1 = tilemap_get_at_pixel(global.map, side + facing, bbox_bottom);	
		var t2 = tilemap_get_at_pixel(global.map, side + facing, bbox_top);
		
		return t1 != tile.none || t2 != tile.none;
	}
	
	#endregion
	
#endregion
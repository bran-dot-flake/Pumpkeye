/// @desc

#region camera
obj_camera.state	= CAM_MODE.following;
obj_camera.target_	= id;
#endregion

#region methods

///@desc change state and corresponding sprite data
function change_state(new_state){
	previous_state  = state;
	state			= new_state;
	frames_in_state	= 0;
	sprite_index	= sprite[state, facing_direction];
	image_speed		= 0;
	image_index		= 0;	
}

///@desc change state, but runs new state and exits code
function change_state_ext(new_state){
	change_state(new_state);
	event_user(new_state);
	exit;
}
#endregion

#region enums
enum PLAYER_STATES {
	move,		
	jump,			
	duck,			
	ducking_slash,	
	standing_slash,	
	jumping_slash,	
	find_treasure,	
	damaged,			
	landing			
}
#endregion

#region variables
	#region animation
		// sprite
	gui_object = instance_create_layer(x, y, LAY_GUI, obj_blank_object);
	image_speed				 = 0;
	image_xscale			 = -1;
	manual_sprite_change	 = false;
	frames_in_state			 = 0;

		// speed and direction
	animation_speed			 = 1;
	target_direction		 = DIR8.left;
	facing_direction		 = DIR8.left;
	damaged_facing_direction = DIR8.right;
	dir_ = (facing_direction == DIR8.right)?1: -1;

		// invincibility
	iframes					 = false;
	iframes_length		     = floor(SEC * 2);
	iframes_timer			 = -1;
	flashing_length			 = floor(SEC * 0.75);
	flashing_timer			 = -1;
	frames_between_flash	 = 12;

		// palette
	pal_sprite				 = spr_palette_link;
	pal_index			   	 = 0;			// normal color
	visible_				 = true;
	#endregion

	#region movement
		// movement
	x_fraction		= 0;
	y_fraction		= 0;
	x_input			= 0;
	y_input			= 0;

		// acceleration
	ground_accel	= 0.1;
	air_accel		= 0.1;

		// friction
	ground_friction	= 0.05;
	air_friction	= 0.01;
	gravity_		= 0.2;

		// speeds
	jump_speed		= -15.5;
	walk_speed		= 1.5;
	air_speed		= 1.5;		// horizontal
	fall_speed		= 4.0;

	x_speed_previous= 0;
	y_speed_previous= 0;
	current_x_speed	= 0;
	current_y_speed	= 0;
	applied_x_speed	= 0;
	applied_y_speed	= 0;

		// collisions
	collision_tilemap = layer_tilemap_get_id("collisions");
	on_ground		= false;
	on_wall			= false;
	wall_left		= false;
	wall_right		= false;
	#endregion

	#region states
	state = PLAYER_STATES.move;
	#endregion

	#region sprites
	sprite[PLAYER_STATES.move,			 DIR8.right]		= spr_link_walk;
	sprite[PLAYER_STATES.move,			 DIR8.up   ]		= noone;
	sprite[PLAYER_STATES.move,			 DIR8.left ]		= spr_link_walk;
	sprite[PLAYER_STATES.move,			 DIR8.down ]		= noone;

	sprite[PLAYER_STATES.jump,			 DIR8.right]		= spr_link_jump;
	sprite[PLAYER_STATES.jump,			 DIR8.up   ]		= noone;
	sprite[PLAYER_STATES.jump,			 DIR8.left ]		= spr_link_jump;
	sprite[PLAYER_STATES.jump,			 DIR8.down ]		= noone

	sprite[PLAYER_STATES.duck,			 DIR8.right]		= spr_link_duck;
	sprite[PLAYER_STATES.duck,			 DIR8.up   ]		= noone;
	sprite[PLAYER_STATES.duck,			 DIR8.left ]		= spr_link_duck;
	sprite[PLAYER_STATES.duck,			 DIR8.down ]		= noone;

	sprite[PLAYER_STATES.ducking_slash,  DIR8.right]		= spr_link_ducking_slash;
	sprite[PLAYER_STATES.ducking_slash,  DIR8.up   ]		= noone;
	sprite[PLAYER_STATES.ducking_slash,  DIR8.left ]		= spr_link_ducking_slash;
	sprite[PLAYER_STATES.ducking_slash,  DIR8.down ]		= noone;

	sprite[PLAYER_STATES.standing_slash, DIR8.right]		= spr_link_standing_slash;
	sprite[PLAYER_STATES.standing_slash, DIR8.up   ]		= noone;
	sprite[PLAYER_STATES.standing_slash, DIR8.left ]		= spr_link_standing_slash;
	sprite[PLAYER_STATES.standing_slash, DIR8.down ]		= noone;

	sprite[PLAYER_STATES.jumping_slash,  DIR8.right]		= spr_link_ducking_slash;
	sprite[PLAYER_STATES.jumping_slash,  DIR8.up   ]		= noone;
	sprite[PLAYER_STATES.jumping_slash,  DIR8.left ]		= spr_link_ducking_slash;
	sprite[PLAYER_STATES.jumping_slash,  DIR8.down ]		= noone;

	sprite[PLAYER_STATES.find_treasure,  DIR8.right]		= noone;
	sprite[PLAYER_STATES.find_treasure,  DIR8.up   ]		= spr_link_find_treasure;
	sprite[PLAYER_STATES.find_treasure,  DIR8.left ]		= noone;
	sprite[PLAYER_STATES.find_treasure,  DIR8.down ]		= noone;

	sprite[PLAYER_STATES.damaged,		 DIR8.right]		= spr_link_hurt;
	sprite[PLAYER_STATES.damaged,		 DIR8.up   ]		= noone;
	sprite[PLAYER_STATES.damaged,		 DIR8.left ]		= spr_link_hurt;
	sprite[PLAYER_STATES.damaged,		 DIR8.down ]		= noone;

	sprite[PLAYER_STATES.landing,		 DIR8.right]		= spr_link_duck;
	sprite[PLAYER_STATES.landing,		 DIR8.up   ]		= noone;
	sprite[PLAYER_STATES.landing,		 DIR8.left ]		= spr_link_duck;
	sprite[PLAYER_STATES.landing,		 DIR8.down ]		= noone;
	sprite_index = sprite[state, facing_direction];
	#endregion

	#region room start position
	switch (global.CURRENT_SAVE_DATA.enter_dir){
		case noone:
		// start at center
			x = rw / 2;
			y = 208;
		break;

		case DIR8.right:
		// entry from the right, go left
			current_x_speed = -2;
			x = rw  - (sprite_get_width(spr_link_duck) / 2);
			y = 208;
			target_direction = DIR8.left;
			facing_direction = DIR8.left;
			image_xscale = -1;
		break;
		
		case DIR8.left:
		// entry from the left, go right
			current_x_speed = 2;
			x = 0 + (sprite_get_width(spr_link_duck) / 2);
			y = 208;
			target_direction = DIR8.right;
			facing_direction = DIR8.right;
			image_xscale = 1;
		break;
		
		default:
		// entry from the top, go down
			x = rw /2;
			y = 56;
		break;
	}
	#endregion
#endregion
/// @desc
event_inherited();

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
enum DEELER_STATES {
	move	= 0,
	drop	= 1,
	dead	= 2,
}
#endregion

#region variables
	#region animation
		// sprite
	image_speed				 = 0;
	manual_sprite_change	 = false;
	frames_in_state			 = 0;
		// speed and direction
	animation_speed			 = 1;
	target_direction		 = DIR8.right;
	facing_direction		 = DIR8.right;
	previous_state			 = 0;
	dir_ = (facing_direction == DIR8.right)?1: -1;
	distance_to_player		 = 0;
	direction_to_player		 = 0;
		// invincibility
	iframes					 = false;
	iframes_length		     = floor(SEC * 0.25);	// use round when not integers
	iframes_timer			 = -1;
	flashing_length			 = floor(SEC * 0.25);
	flashing_timer			 = -1;
	frames_between_flash	 = 12;
		// palette
	pal_sprite				 = spr_palette_deeler;
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
	ground_accel	= 0.05;
	air_accel		= 0.1;
		// friction
	ground_friction	= 0.05;
	air_friction	= 0.01;
	gravity_		= 0.2;
		// speeds
	jump_speed		= -15.5;
	walk_speed		= 1;
	air_speed		= 1.0;		// horizontal
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

	#region states, timers
	state			= DEELER_STATES.move;
	previous_state	= DEELER_STATES.move;
	state_switch_length	= random(SEC *6);
	y_level				= ystart;		// max height
	drop_down			= true;
	#endregion

	#region sprites
	sprite[DEELER_STATES.move,		 DIR8.right]		= spr_enemy_deeler_move;
	sprite[DEELER_STATES.move,		 DIR8.up   ]		= noone;
	sprite[DEELER_STATES.move,		 DIR8.left ]		= spr_enemy_deeler_move;
	sprite[DEELER_STATES.move,		 DIR8.down ]		= noone;
	
	sprite[DEELER_STATES.drop,		 DIR8.right]		= spr_enemy_deeler_move;
	sprite[DEELER_STATES.drop,		 DIR8.up   ]		= noone;
	sprite[DEELER_STATES.drop,		 DIR8.left ]		= spr_enemy_deeler_move;
	sprite[DEELER_STATES.drop,		 DIR8.down ]		= noone;

	sprite[DEELER_STATES.dead,		 DIR8.right]		= noone;
	sprite[DEELER_STATES.dead,		 DIR8.up   ]		= noone;
	sprite[DEELER_STATES.dead,		 DIR8.left ]		= noone;
	sprite[DEELER_STATES.dead,		 DIR8.down ]		= noone;
	#endregion

	#region stats
	hp				= 2;
	damage			= 8;
	exp_given		= 2;
	#endregion
#endregion
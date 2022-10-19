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
enum BIT_STATES {
	idle	= 0,
	move	= 1,
	dead	= 2,
}
#endregion

#region variables
	#region animation
		// sprite
	image_speed				 = 0;
	image_xscale			 = 1;
	manual_sprite_change	 = false;
	frames_in_state			 = 0;

		// speed and direction
	animation_speed			 = 1;
	target_direction		 = DIR8.right;
	facing_direction		 = DIR8.right;
	damaged_facing_direction = DIR8.left;
	previous_state			 = 0;
	dir_ = (facing_direction == DIR8.right)?1: -1;

		// invincibility
	iframes					 = false;
	iframes_length		     = floor(SEC * 0.3);	// use round when not integers
	iframes_timer			 = -1;
	flashing_length			 = floor(SEC * 1);
	flashing_timer			 = -1;
	frames_between_flash	 = 12;

		// palette
	pal_sprite				 = spr_palette_bit;
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
	walk_speed		= 0;
	walk_speed_slow	= 2;
	walk_speed_fast	= 4;
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
	state_switch_timer = SEC *1;
	state			= BIT_STATES.idle;
	previous_state	= BIT_STATES.idle;
	#endregion

	#region sprites
	sprite[BIT_STATES.idle,			 DIR8.right]		= spr_enemy_bit_idle;
	sprite[BIT_STATES.idle,			 DIR8.up   ]		= noone;
	sprite[BIT_STATES.idle,			 DIR8.left ]		= spr_enemy_bit_idle;
	sprite[BIT_STATES.idle,			 DIR8.down ]		= noone;

	sprite[BIT_STATES.move,			 DIR8.right]		= spr_enemy_bit_move;
	sprite[BIT_STATES.move,			 DIR8.up   ]		= noone;
	sprite[BIT_STATES.move,			 DIR8.left ]		= spr_enemy_bit_move;
	sprite[BIT_STATES.move,			 DIR8.down ]		= noone

	sprite[BIT_STATES.dead,			 DIR8.right]		= noone;
	sprite[BIT_STATES.dead,			 DIR8.up   ]		= noone;
	sprite[BIT_STATES.dead,			 DIR8.left ]		= noone;
	sprite[BIT_STATES.dead,			 DIR8.down ]		= noone;
	sprite_index = sprite[BIT_STATES.move, facing_direction];	// fixes issue with starting late
	#endregion

	#region stats
	hp		= 2;
	damage	= 4;
	exp_given = 2;
	#endregion
	
#endregion
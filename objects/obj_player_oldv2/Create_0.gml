/*

#region Enums

#macro cs 8


enum player_states {
	born,
	move,
	idle,
	jump,
	skid,
	
	jump_down,
	pause,
};
	
#endregion



#region Variables


#region Customizable


// Speeds
max_x_speed		= 1.5;
max_y_speed		= 8;
jump_speed		= -5.5
walk_speed		= .5;
deccel			= 0.12;

// Times
coyote_time		= 10;

// Jumps
max_jumps		= 1;


// Starting position / state
facing			= 1;
state			= player_states.born;


#endregion


#region Static


// Speeds
x_speed			= 0;
y_speed			= 0;
x_speed_frac	= 0;
y_speed_frac	= 0;


// Movement
grounded		= 0;
walled			= 0;
jumps			= max_jumps;


// Animation
frames			= 0;


// Input
attack			= 0;
jump			= 0;
x_input			= 0;
y_input			= 0;
frames			= 0;


// Timers
button_timer	= array_create(input.Height - 1, 0);
button_time		= 8;
squish_x		= 0;
squish_y		= 0;
coyote_timer	= 0;


#endregion


#endregion



#region Weapons


weapon = obj_funny_bullet;


#endregion



#region Sprites



enum player_sprites {head_normal, head_shoot, hands, body};
enum player_sprite_index {head, hands, body}


// Born
sprite[player_states.born, player_sprites.head_normal]	= undefined;
sprite[player_states.born, player_sprites.head_shoot]	= undefined;
sprite[player_states.born, player_sprites.hands]		= undefined;
sprite[player_states.born, player_sprites.body]			= spr_pumpkin_rise;


// Walk
sprite[player_states.move, player_sprites.head_normal]	= undefined//spr_head_normal_walk;
sprite[player_states.move, player_sprites.head_shoot]	= undefined//spr_head_shoot_walk;
sprite[player_states.move, player_sprites.hands]		= undefined//spr_hands_walk;
sprite[player_states.move, player_sprites.body]			= spr_pumpkin_walk_new;

// Idle
sprite[player_states.idle, player_sprites.head_normal]	= spr_head_normal_idle;
sprite[player_states.idle, player_sprites.head_shoot]	= spr_head_shoot_idle;
sprite[player_states.idle, player_sprites.hands]		= spr_hands_idle;
sprite[player_states.idle, player_sprites.body]			= spr_body_idle;


// Fall
	// Up
sprite[player_states.jump, player_sprites.head_normal]	= spr_head_normal_fall_up;
sprite[player_states.jump, player_sprites.head_shoot]	= spr_head_shoot_fall_up;
sprite[player_states.jump, player_sprites.hands]		= spr_hands_fall_up;
sprite[player_states.jump, player_sprites.body]			= spr_body_fall_up;
	// Down
sprite[player_states.jump_down, player_sprites.head_normal]		= spr_head_normal_fall_down;
sprite[player_states.jump_down, player_sprites.head_shoot]		= spr_head_shoot_fall_down;
sprite[player_states.jump_down, player_sprites.hands]			= spr_hands_fall_down;
sprite[player_states.jump_down, player_sprites.body]			= spr_body_fall_down;


// Skid
sprite[player_states.skid, player_sprites.head_normal]		= undefined;
sprite[player_states.skid, player_sprites.head_shoot]		= undefined;
sprite[player_states.skid, player_sprites.hands]			= undefined;
sprite[player_states.skid, player_sprites.body]				= spr_pumpkin_skid;


_sprite_index = [];
mask_index = spr_pumpkin_walk;


#endregion



#region Initialize functions

// Inherit functions
player_other_functions();
player_state_functions();
player_change_state_functions();


// Set respawn point
global.respawn_point.x = x;
global.respawn_point.y = y;


// Set state variables
change_state(state);


// Start music
play_song(mus_150, 1);


// Set camera target
camera_set_target(id);

#endregion



#region Debug

debug_add_instance_entry(id, "state")
debug_add_instance_entry(id, "grounded")


#endregion



#region Methods


function input_set_buffer(_button) {
	if ip(_button) button_timer[_button] = button_time;
}


function input_reset_buffer(_button) {
	button_timer[_button] = 0;
}



function squish(_squish_x, _squish_y) {
	squish_x = _squish_x;
	squish_y = _squish_y;
}

#endregion
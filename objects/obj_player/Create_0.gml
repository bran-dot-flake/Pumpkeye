
play_song(mus_150, 1)

#macro cs 8
global.gravity = .2


enum player_states {
	born,
	move,
	idle,
	jump,
	pause,
};


// Speeds
max_x_speed		= 2;
max_y_speed		= 8;
jump_speed		= -4
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


// Animation
facing			= 1;

// States
state			= player_states.born;
frames			= 0;


// Input
attack			= 0;
jump			= 0;
x_input			= 0;
y_input			= 0;
frames			= 0;



sprite[player_states.born]	= spr_pumpkin_rise;
sprite[player_states.move]	= spr_pumpkin_walk;
sprite[player_states.jump]	= spr_pumpkin_walk;
sprite[player_states.idle]	= spr_pumpkin_idle;
sprite[player_states.pause] = spr_pumpkin_walk;


player_other_functions();
player_state_functions();

change_state(state);


debug_add_instance_entry(id, "state")
debug_add_instance_entry(id, "grounded")


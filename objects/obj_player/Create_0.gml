<<<<<<< HEAD
xspd = 0;
xspd_carry = 0;
yspd = 0;
grv = 0.2;
walkspd = 2;
coyote_time = 0;
coyote_time_max = 10;
key_down = 0;

function on_ground(_obj)
{	
	if place_meeting(x, y+1, _obj)
	{
		return true;
	}
	else return false;
}
function coyo_time()
{
	if (coyote_time > 0) coyote_time --;
	
		if on_ground(obj_wall)
		{
			coyote_time = coyote_time_max;
		}
			if on_ground(Obj_moving_platform)
				{
					coyote_time = coyote_time_max;
				}
}
=======

play_song(mus_150, 1)
camera_set_target(id);


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
sprite[player_states.idle]	= spr_pumpkin_walk;
sprite[player_states.pause] = spr_pumpkin_walk;


player_other_functions();
player_state_functions();

change_state(state);


debug_add_instance_entry(id, "state")
debug_add_instance_entry(id, "grounded")

>>>>>>> 61808e097d1da8319d62208e6b689a75267f65a4

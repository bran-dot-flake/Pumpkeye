
enum grass_states {idle, smush};

sprite[grass_states.idle]	= spr_grass;
sprite[grass_states.smush]	= spr_grass_smush;
state = grass_states.idle;

timer = 0;
time = 25;


function change_state(_state) {
	state = _state;
	sprite_index = sprite[_state];
	image_index = 0;
	image_speed = 1;
}

change_state(state);
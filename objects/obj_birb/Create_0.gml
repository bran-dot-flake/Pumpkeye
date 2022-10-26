
enum birb_states {idle, fly}

state	= birb_states.idle;
facing	= 0;
x_speed = 4;
y_speed = 2;
frames	= 0;


sprite[birb_states.idle]	= spr_birb_idle;
sprite[birb_states.fly]		= spr_birb_fly;



function change_state(_state) {
	state = _state;
	sprite_index = sprite[_state];
	frames = 0;
}

change_state(state)

enum key_states {idle, follow}

target	= noone;
frames	= 0;
state	= key_states.idle;
y_offset = 0;


function change_state(_state) {
	state	= _state;
	frames	= 0;
	y_offset = 0;
}
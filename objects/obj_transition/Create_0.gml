
enum transition_states {off, intro, wait, outro}

state		= transition_states.off;
timer		= 0;
time		= 60;
depth		= depths.gui;


trans_complete = false;





frames		= 0;
draw		= false;




function initialize()
{
	instance	= noone;
	target_room	= noone;
}




function change_state(_state)
{
	state		= _state;
	franes		= 0;
	draw		= false;
}


initialize();
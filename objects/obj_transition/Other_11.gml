///@desc Intro

if !instance_exists(par_transition)
{
	// Next state
	timer = time;
	change_state(transition_states.wait);
	
	// Next room
	if		target_room == "next"	room_goto_next()
	else if target_room != noone	room_goto(target_room)
	
	draw = true;

}
function player_change_state_functions(){

////	Sub State Changes	////
function player_jump()
{
	change_state(player_states.jump);
	applied_y_speed = jump_speed;
	jumps--;
	//squish(-.4, .3);
}


function player_land()
{
	var ste = x_input != 0 ? player_states.move : player_states.idle;
	change_state(ste);
	
	squish(.4, -.3);
}


function player_fall()
{
	if !grounded() change_state(player_states.jump);
}


function player_shoot(_theta) {
	if attack {
		var ycent	= y - 8;
		var xend	= facing ? bbox_right : bbox_left;	
		
		var inst = instance_create_depth(xend, ycent, depths.fx_bottom, weapon);
		with inst {
			angle = _theta;
		}
	}
}

}
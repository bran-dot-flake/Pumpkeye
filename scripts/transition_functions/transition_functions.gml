
function transition(_room = noone) 
{	
	var inst  = instance_create_depth(0, 0, depths.gui, obj_fade_transition);
	inst.type = transition_type.intro;
	inst.target_room = _room
	
}



function transition_end()
{
	return !instance_exists(par_transition);
}
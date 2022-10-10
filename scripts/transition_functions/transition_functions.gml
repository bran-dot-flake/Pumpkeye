
function transition(_type, _room = noone) 
{	
	obj_transition.instance = instance_create_depth(0, 0, depths.gui, obj_block_transition);
	obj_transition.instance.type = transition_type.intro;
	
	obj_transition.state = transition_states.intro;
	obj_transition.target_room = _room;
	//obj_transition.transition_type = _type;
}



function transition_end()
{
	return obj_transition.state == transition_states.off;	
}
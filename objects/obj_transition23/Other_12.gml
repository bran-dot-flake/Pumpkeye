///@desc Wait

if timer <= 0
{
	// Next state
	change_state(transition_states.outro);
	
	
	// Create the instance
	instance = instance_create_depth(0, 0, depths.gui, obj_block_transition);
	instance.type = transition_type.outro;
	
	draw = false;
}
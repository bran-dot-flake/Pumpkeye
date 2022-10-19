/*
#region Timers

//squish = lerp(squish, 0, .3);

#endregion


#region State execution
	
	if instance_exists(obj_pause) change_state(p_states.Pause)
	
	// Execute state
	event_user(state);
	
#endregion


#region Debug

//debug_add("st", state)
//debug_add("ysp", y_speed);

#endregion
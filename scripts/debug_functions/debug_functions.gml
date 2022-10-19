

function debug_add_instance_entry(_id, _varname)
{
	// Check for instance
	var _exists = variable_instance_exists(_id, _varname);
	var in = false;
	
	// See if its in the array
	for (var i = 0; i < array_length(obj_debug.instance); i++)
	{
		// Break
		if obj_debug.instance[i] == [_id, _varname]
		{
			in = true;
			break;
		}
	}

	// Add it
	if !in array_push(obj_debug.instance, [_id, _varname]);
}



function debug_add_global_entry(_varname)
{
	// Check for instance
	var _exists = variable_global_exists(_varname);
	var in = false;
	
	// See if its in the array
	for (var i = 0; i < array_length(obj_debug.globals); i++)
	{
		// Break
		if obj_debug.globals[i] == _varname
		{
			in = true;
			break;
		}
	}

	// Add it
	if !in array_push(obj_debug.globals, _varname);
}
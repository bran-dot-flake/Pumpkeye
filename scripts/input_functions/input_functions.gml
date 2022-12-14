

function input_held(_button) {
	return (obj_input.held[input_check_index.gamepad, _button] 
			or obj_input.held[input_check_index.keyboard, _button])
}


function input_pressed(_button) {
	return (obj_input.pressed[input_check_index.gamepad, _button] 
			or obj_input.pressed[input_check_index.keyboard, _button])
}


function input_released(_button) {
	return (obj_input.released[input_check_index.gamepad, _button] 
			or obj_input.released[input_check_index.keyboard, _button])
}



function input_pressed_any()
{
	// Loop through each button (same array length)
	for (var i = 0; i < input.Height - 2; i++)
	{
		// Button pressed
		if input_held(i) return true;
	}
	
	// None pressed
	return false;
}



#macro ih input_held
#macro ip input_pressed
#macro ir input_released
#macro ipa input_pressed_any
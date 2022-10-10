

#region Timers


x_offset = lerp(x_offset, target_x_offset, .4);
button_timer = approach(button_timer, 0, 1)

#endregion


#region Input


var a_in = ip(input.Confirm);
var b_in = ip(input.Deny);
var x_in = ip(input.Right) - ip(input.Left);


#endregion


#region Carry out action


// For a-input dependent buttons
if a_in and selected and button_timer <= 0 switch type {
	
	
	case settings_type.binary:

		play_sfx(global.sounds.menu_confirm);
		button_timer = 2;

		// Set to opposite
		global.save_data[$ name] = !global.save_data[$ name];

	break;
	

}


//  For x-input dependent buttons
if x_in != 0 and selected switch type {
	
	case settings_type.multiplier:

		// Play increment sound
		if !audio_is_playing(global.sounds.menu_slide)
			play_sfx(global.sounds.menu_slide);
		
		// Increase variable
		var xmin = 1; var xmax = floor(display_get_height() / gh) - 1;
		var val = global.save_data[$ name];
		val += x_in;
		
		// Clamp variable
		global.save_data[$ name] = clamp(val, xmin, xmax);

		
		obj_camera.initialize();
		
	break;
	
	
	case settings_type.slider:
		
		// Increment
		if !audio_is_playing(global.sounds.menu_slide)
			play_sfx(global.sounds.menu_slide);
		var perc		= global.save_data[$ name]
		var cnt_perc	= 1 / count;

		// Go by 20's
		global.save_data[$ name] = clamp(perc + cnt_perc * x_in, 0, 1)

	break;

}


#endregion


// Reduce level; deselect
if b_in and selected {
	play_sfx(global.sounds.menu_back);
	instance.selected_level	--;
	selected				= false;
	target_x_offset			= 0;
}
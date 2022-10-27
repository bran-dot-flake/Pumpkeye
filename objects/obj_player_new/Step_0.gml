
#region Timers


// Input buffer
for (var i = 0; i < array_length(button_timer); i++) {
	button_timer[i] = approach(button_timer[i], 0, 1);	
}


//Squish
squish_x = approach(squish_x, 0, .05);
squish_y = approach(squish_y, 0, .05);


// Coyote
coyote_timer = approach(coyote_timer, 0, 1);


#endregion


event_user(state);

//if attack player_shoot(facing_to_angle(facing));
///@desc Play


#region Text
	
	
// Increase count
var pcount = count;
if palette_fade_end() count += text_speed;
count = clamp(count, 0, string_length(text[page]));


// New character
if floor(pcount) != floor(count) 
{
	// Play sound
	//if floor(count) mod 4 == 0 play_sfx(_5_Menu_Screen_Slide_SFX_01);
		
	// Add pauses
	switch string_char_at(text[page], count)
	{
		case ",":
		case ".":
		case "!": timer[0] = time[0];	  break;
		case "?": timer[0] = time[0] * 2; break;
	}
}
	
	
#endregion
	
	
// Signal new page
if page <= page_number and count >= string_length(text[page]) 
{
	if timer[1] == 0 timer[1] = time[intro_times.page_end];
	if timer[1] == 1 {
		palette_fade(transition_type.outro);
		state = intro_states.outro;
	}
}
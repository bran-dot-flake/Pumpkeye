
timer = approach(timer, 0, 1);


if timer == 0 
{
	width		= lerp(width, target_width, 0.3);
	y_offset	= lerp(y_offset, target_y_offset, 0.3);
	
	
	// Skip animation
	if ipa() 
	{
		width = target_width;
		//y_offset = target_y_offset;
	}
	
	
	// Done moving
	if y_offset == target_y_offset
	{
		// In the press anykey stage
		if state == 0
		{
			// Increase text count
			count += text_speed;
			count = clamp(count, 0, string_length(text));
			
			
			// Increase color wave count
			color = floor(.1 + (sin(frames / 20) * 3));
			
			
			// Add to frames
			frames++;
		
			
			// Next state
			if ipa() 
			{
				state++;
				instance_create_depth(0, 0, depths.gui, obj_title);
			}
		}
	}
}
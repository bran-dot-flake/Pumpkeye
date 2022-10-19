
if instance != noone
{	
	var ix = instance.x;
	var iy = instance.y
	var _spd = .3;
	
	// Move toward target
	ix = lerp(ix, target_x, _spd);
	iy = lerp(iy, target_y, _spd);
	timer = approach(timer, 0, 1);
	
	
	// Hold
	if abs(ix - target_x) < .2 and abs(iy - target_y) < .2
	{
		
		switch state
		{
			case 0:
			if timer == 0 timer = time + 1;
			if timer == 1
			{
				// Set new target
				target_x = ix + (width * move_x * -1);
				target_y = iy + (width * move_y * -1);
				state++;
			}
			break;
			
			case 1:
			instance_destroy();
			break;
		}
	}
	
	instance.x = ix;
	instance.y = iy;
}
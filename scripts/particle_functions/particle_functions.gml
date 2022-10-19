

function foot_dust(_x, _y, _dir)
{
	// Make multiple
	for (var i = 0; i < 3; i ++)
	{
		// Create the Instance
		var part = instance_create_layer(_x + _dir, _y, LAY_FX, obj_foot_dust);
	
		// Give Particle Attributes
		with part
		{
			
			// Speed
			var spd = 2;
			x_speed = spd * -_dir;
			y_speed = 0;
			dir		= _dir;
			
			// Time alive
			life	= 60;
			age		= 0;
			size	= 5;
			decay	= .3;
			
			deccel	= 0.8
		}
	}
}
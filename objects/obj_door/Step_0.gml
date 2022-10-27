

// Shut
if closed
{
	image_speed = 0;
	image_index = 0;
	
	if tilemap_get_at_pixel(global.map, x, y) == tile.none
		tilemap_set_at_pixel_scale(global.map, tile.solid, x, y, sprite_width div cs);
		
}


// Open
else
{
	if time > 20 {
		// Animate
		image_speed = 1;
	
	
		// Smash key
		with instance_nearest(x, y, obj_key) {
			if other.time > 30 image_yscale = approach(image_yscale, 0, .07)	
		}
	}
	
	// Destroy
	if animation_end() {
		with instance_nearest(x, y, obj_key) instance_destroy();
		
		instance_destroy();
		tilemap_set_at_pixel_scale(global.map, tile.none, x, y, sprite_width div cs);
	}
	
	time++;
}
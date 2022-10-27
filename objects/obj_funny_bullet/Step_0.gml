
if die exit;


// Calculate movement
x_speed = lengthdir_x(_speed, angle);
y_speed = lengthdir_y(_speed, angle);


// Apply movement
x += x_speed;
y += y_speed;


// Calculate die
var coll		= tilemap_get_at_pixel(global.map, x, y) != tile.none
var out_screen	= !in_screen();
var no_range	= point_distance(xstart, ystart, x, y) >= distance;


if coll or out_screen or no_range die = true;



// Apply die
if die {
	if coll screen_jolt();
	
	instance_destroy();	
}
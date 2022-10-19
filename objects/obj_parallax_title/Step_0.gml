
timer = approach(timer, 0, 1);
if ipa() timer = 0;


if timer != 0 exit;

// Move x
var i = 0; repeat array_length(_x) 
{
	_x[i] += x_speed[i]
	if _x[i] > sprite_width _x[i] -= sprite_width;
	i++;
}


// Move y
y = approach(y, global.defaults.parallax_y, y_speed);
if ipa() y_speed = 4;


if y == target_y
{
	if !instance_exists(obj_uhh) instance_create_depth(0, 0, depth - 1, obj_uhh);	
}
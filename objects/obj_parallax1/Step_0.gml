


var i = 0; repeat array_length(_x) 
{
	_x[i] += x_speed[i]
	if _x[i] > sprite_width _x[i] -= sprite_width;
	i++;
}
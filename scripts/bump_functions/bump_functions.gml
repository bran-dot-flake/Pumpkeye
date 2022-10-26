
///@arg obj
///@arg x?
///@arg dist
function bump(_obj, _x, _dist)
{
	var inst = instance_create_depth(0, 0, 0, obj_bump);
	with inst 
	{
		// Set targets
		instance	= _obj; 
		distance	= _dist;
		
		move_x		= _x;
		move_y		= !_x;
		facing		= sign(_dist);
		
		target_x = _obj.x + move_x * _dist;
		target_y = _obj.y + move_y * _dist;
	}
}
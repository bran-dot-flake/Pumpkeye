xspd = 0;
yspd = 0;
grv = 0.2;
walkspd = 2;
coyote_time = 0;
coyote_time_max = 10;


function on_ground(_obj)
{	
	if place_meeting(x, y+1, _obj)
	{
		return true;
	}
	else return false;
}
function coyo_time()
{
	if (coyote_time > 0) coyote_time --;
	
	if on_ground(obj_wall)
	{
		coyote_time = coyote_time_max;
	}
}
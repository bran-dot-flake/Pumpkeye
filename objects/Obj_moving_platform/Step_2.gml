
//move
x += xspd;
y += yspd;

//check if its at the starting point
if (going_to_start && point_distance(x, y, startX, startY) < current_speed)
{
	going_to_start = false;
	current_speed = 0;
	alarm[0] = wait_time;
}

//check if its at the end point
if (!going_to_start && point_distance(x, y, endX, endY) < current_speed)
{
	going_to_start = true;
	current_speed = 0;
	alarm[0] = wait_time;
}




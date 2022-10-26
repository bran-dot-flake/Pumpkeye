
//gets target
var _targetX = endX, _targetY = endY;
if (going_to_start)
{
	_targetX = startX;
	_targetY = startY;
}

// sets the movement
xspd = sign(_targetX - x) * current_speed;
yspd = sign(_targetY - y) * current_speed;


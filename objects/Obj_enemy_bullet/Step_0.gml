x += lengthdir_x(3,direction);
y += lengthdir_y(3,direction);

if (place_meeting(x,y,obj_wall)) && (image_index !=0)
{
	while (place_meeting(x,y,obj_wall))
	{
		x -= lengthdir_x(1,direction);
		y -= lengthdir_y(1,direction);
	}
	spd = 0;
	instance_destroy(Obj_enemy_bullet)
}


//players restarts

if place_meeting(x, y, obj_player)
{
	
	room_goto(target_rm)
	obj_player.x = target_x;
	obj_player.y = target_y;
	
}
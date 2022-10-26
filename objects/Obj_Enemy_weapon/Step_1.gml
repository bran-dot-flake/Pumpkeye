x = owner.x+5;
y = owner.y+4;

image_xscale = abs(owner.image_xscale);
image_yscale = abs(owner.image_yscale);

if (instance_exists(obj_player))
{
	if (obj_player.x < x) image_yscale = image_yscale;
	if (point_distance(obj_player.x, obj_player.y,x,y) < 250)
	{
		image_angle = point_direction(x,y,obj_player.x, obj_player.y);
		countdown--;
		if(countdown <= 0)
		{
			countdown = countdown_rate;
			//bullet code here
			with (instance_create_layer(x,y,"Bullets", Obj_enemy_bullet))
			{
				spd = 10;
				direction = other.image_angle + random_range(-3,3);
				image_angle = direction;
			}
		}
	}
}


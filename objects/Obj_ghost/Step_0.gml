/* 
x = x +lengthdir_x(0.5, point_direction(x, y, obj_player.x, obj_player.y));
y = y +lengthdir_y(0.5, point_direction(x, y, obj_player.x, obj_player.y));
*/

direction = point_direction(pos_x, pos_y, obj_player.x, obj_player.y)
speed = spd;
pos_x = x;
pos_y = y;

if float != float_dist
{
	y += float_spd * float_mod;
	float += 1;
}
if float != float_dist -2
{
	float_mod = 0.5;
}
if float != float_dist
{
	float_spd *= -1;
	float += 0;
	float_mod = 1;
}


if obj_player.x >= x
{
	dir = "right"
	image_xscale = -1;
}
if obj_player.x < x
{
	dir = "left"
	image_xscale = 1;
	
}


//kill player///

if (place_meeting(x, y,obj_player))
{
	game_restart();
}


/*
if(xspd <= 0)
{
	sprite_index = spr_ghost_left;  //jumping/falling sprite
	image_speed = 0;
}
else
{
	sprite_index = spr_ghost;  //jumping/falling sprite
	image_speed = 0;
}


yspd = yspd + grv;




//horizontal collision
if (place_meeting(x+xspd, y,obj_wall))
{
	while (!place_meeting(x + sign(xspd), y, obj_wall))
	{
		x = x + sign(xspd);	
	}
	xspd = -xspd;
}
x = x + xspd;


// vertical collision
if (place_meeting(x, y+yspd,obj_wall))
{
	while (!place_meeting(x, y + sign(yspd), obj_wall))
	{
		y = y + sign(yspd);	
	}
	yspd = 0;
}
y = y + yspd;

//kill player///

if (place_meeting(x, y,obj_player))
{
	game_restart();
}
//Animations
if(!place_meeting(x,y+1,obj_wall))
{
	sprite_index = spr_zombie_fall;  //jumping/falling sprite
	image_speed = 0;
	if(sign(yspd) > 0) image_index = 1; else image_index = 0;
}
else
{
	image_speed = 1;
	if (xspd == 0)
	{
		sprite_index = spr_zombie_right;    // idle
	}
	else
	{
		sprite_index = spr_zombie_right;    //facing right
	}
}

if(xspd != 0) image_xscale = sign(xspd);   //this flips the sprite to face the left 












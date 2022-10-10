


// get input from player//
 var right_key = keyboard_check(ord("D"))
 
 var left_key = keyboard_check(ord("A"))
 
 var space_key = keyboard_check_pressed(vk_space);

////////////calculate movement////////////
var _move = right_key - left_key;

xspd = _move * walkspd;

yspd = yspd + grv;


/////// vv COYOTE TIME vv /////

coyo_time()

///////jumping//////////

if (coyote_time > 0) && (space_key)
{
	coyote_time = 0;
	yspd = -4.5;
}


/////////////horizontal collision/////////////////////
if (place_meeting(x+xspd, y,obj_wall))
{
	while (!place_meeting(x + sign(xspd), y, obj_wall))
	{
		x = x + sign(xspd);	
	}
	xspd = 0;
}
x = x + xspd;


///////////// vertical collision////////////////
if (place_meeting(x, y+yspd,obj_wall))
{
	while (!place_meeting(x, y + sign(yspd), obj_wall))
	{
		y = y + sign(yspd);	
	}
	yspd = 0;
}
y = y + yspd;


//////////////Animations//////////////
if(!place_meeting(x,y+1,obj_wall))
{
	sprite_index = spr_player_jump;
	image_speed = 0;
	if(sign(yspd) > 0) image_index = 1; else image_index = 0;
}
else
{
	image_speed = 1;
	if (xspd == 0)
	{
		sprite_index = spr_player_idle;
	}
	else
	{
		sprite_index = spr_player_right;
	}
}

if(xspd != 0) image_xscale = sign(xspd); //this flips the sprite to face the left 










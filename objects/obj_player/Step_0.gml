
#region Timers



<<<<<<< HEAD
// get input from player//
 var right_key = keyboard_check(ord("D"))
 
 var left_key = keyboard_check(ord("A"))
 
 var space_key = keyboard_check_pressed(vk_space);
 
key_down = keyboard_check(ord("S"))

////////////calculate movement////////////
var _move = right_key - left_key;

xspd = _move * walkspd;

yspd = yspd + grv;


/////// vv COYOTE TIME vv /////

coyo_time()

///////jumping//////////

if (coyote_time > 0) && (space_key) || (space_key && (place_meeting(x,y+1, Obj_moving_platform)))
{
	coyote_time = 0;
	yspd = -4.5;
}


//var xspd_final = xspd + xspd_carry;
//xspd_carry = 0;


var _movingPlatform = instance_place(x,y + max(1, yspd), Obj_moving_platform);
if (_movingPlatform && bbox_bottom <= _movingPlatform.bbox_top) {
	if (yspd > 0) {
		while (!place_meeting(x,y + sign(yspd), Obj_moving_platform)) {
			y += sign(yspd);
		}
		
		yspd = 0;
		
	}
	
	x += _movingPlatform.xspd;
	y += _movingPlatform.yspd;
}



/////////////horizontal collision/////////////////////
if (place_meeting(x+xspd, y,obj_wall))
{
	while (!place_meeting(x + sign(xspd), y, obj_wall))
	{
		x = x + sign(xspd);	
	}
	xspd = 0;
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
/////////////////////////////////////

//ignore this

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

if(place_meeting(x,y+1,Obj_moving_platform))
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







=======
#endregion
>>>>>>> 61808e097d1da8319d62208e6b689a75267f65a4


event_user(state);
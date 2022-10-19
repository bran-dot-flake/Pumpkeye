
// Positioning temps
var str		= ceil(global.time);
var bord	= 6;
target_width= string_width(str) + bord*2;
var box_h	= string_height(str) + bord*2;

if frames == 1 width = target_width


// Draw the box
draw_sprite_ext(sprite_index, 0, screen.x + x, screen.y + y,
				width / sprite_width, box_h / sprite_height, 
				0, c_white, 1);



// Draw the time
draw_text(screen.x + x + bord, screen.y + y + bord, str);
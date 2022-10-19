
var line_sep	= 2;
var line_w		= 1;
var text_sep	= 45;


// Draw title
draw_set_halign(fa_center);
draw_sprite(sprite_index, image_index, (gw / 2) - sprite_width / 2, y + y_offset)


// Line
if width != 0 draw_rectangle(-width / 2 + gw / 2, y + sprite_height + line_sep,
	width / 2 + gw /2 , y + sprite_height + line_sep + line_w - 1, 0)


// Text
var str = "PRESS ANYKEY";
var substr = string_copy(str, 1, count);


draw_set_color(global.defaults.pal[abs(color)]);
if state == 0 draw_text(gw / 2, y + sprite_height + text_sep, substr);
draw_set_color(c_white)


draw_set_halign(fa_left);
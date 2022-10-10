
#region Temps


var picbox_w	= 2;
var picbox_dim	= new vec2(160, 56);
var picbox_pos	= new vec2(48, 72);

var pic_dim		= new vec2(sprite_get_width(global.sprites.intro_scene),
					sprite_get_height(global.sprites.intro_scene));
var pic_pos		= new vec2(picbox_pos.x + picbox_w, picbox_pos.y + picbox_w);


var txt_sep		= new vec2(8, 7);
var txt_pos		= new vec2(picbox_pos.x + txt_sep.x, 
					picbox_pos.y + txt_sep.y + picbox_dim.y);
var txt_w		= picbox_dim.x - txt_sep.x * 2;


#endregion


#region Picture Box


// Draw the box chunky
var c = global.defaults.pal[0];
for (var i = 0; i < 2; i++) {
	draw_rectangle_color(picbox_pos.x + i + 1, picbox_pos.y + i + 1, picbox_pos.x + picbox_dim.x - i - 2,
						picbox_pos.y + picbox_dim.y - i -2, c, c, c, c, 1);
}


#endregion


#region Picture


// Draw the box chunky
draw_sprite(global.sprites.intro_scene, page, pic_pos.x, pic_pos.y);


#endregion


#region Text


// Draw the text
var substr = string_copy(text[page], 1, floor(count));
draw_text_ext(txt_pos.x, txt_pos.y, substr, string_height("A") + 4, 900000)


#endregion
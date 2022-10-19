

var c = global.defaults.pal[2]
draw_rectangle_color(0, y + sprite_height, gw, gh, c, c, c, c, 0)

// Draw the layer
for (var lay = 0; lay < image_number; lay++) 
{
	for (var i = -1; i < 20; i++) 
	{
		draw_sprite(sprite_index, lay, floor(_x[lay]) + sprite_width * i, y);
	}
}


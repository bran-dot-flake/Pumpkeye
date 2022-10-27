


function draw_sprite_outline(_sprite, _image_index, _x, _y) {
	
	// Bottom: outline
	for (var xx = _x - 1; xx < _x + 1; xx++) {
		for (var yy = _y - 1; yy < _y + 1; yy++) {
			draw_set_color(c_black);
			draw_sprite(_sprite, _image_index, xx, yy);
			draw_set_color(c_white);
		}
	}
	
	// Top: normal
	draw_sprite(_sprite, _image_index, _x, _y);
}


function draw_sprite_ext_outline(_sprite, _image_index, _x, _y, _xscale, 
								_yscale, _rot, _col, _alpha) {
	
	// Bottom: outline
	for (var xx = _x - 1; xx < _x + 1; xx++) {
		for (var yy = _y - 1; yy < _y + 1; yy++) {
			draw_sprite_ext(_sprite, _image_index, xx, yy,
							_xscale, _yscale, _rot, c_black, _alpha);
		}
	}
	
	// Top: normal
	draw_sprite_ext(_sprite, _image_index, _x, _y,
					_xscale, _yscale, _rot, _col, _alpha);
}


// Self
//draw_sprite_ext(sprite_index, image_index, x, y, facing + squish_x * facing, image_yscale + squish_y, 0, c_white, 1);

// Draw self
for (var i = 0; i < array_length(_sprite_index); i++) {
	
	// Skip
	if _sprite_index[i] == undefined continue;
	
	// Draw
	draw_sprite_ext(_sprite_index[i], image_index, x, y,
					 facing + squish_x * facing, image_yscale + squish_y, 0, c_white, 1);
}



// Bbox
draw_set_color(c_lime)
//draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 1)
draw_set_color(c_white)
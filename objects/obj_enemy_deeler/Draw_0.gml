/// @desc

// draw the spider silk
if (state == DEELER_STATES.drop){
	draw_line_color(x, y_level -sprite_height/2, x, y, c_white, c_white);
}

if (flashing_timer != -1){
	pal_swap_set(pal_sprite, pal_index);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	pal_swap_reset();
	if (flashing_timer mod 2 == 0){pal_index = wrap(++pal_index, 0, sprite_get_width(pal_sprite) -1);}	// change every 2 frames (every other)
} else{
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
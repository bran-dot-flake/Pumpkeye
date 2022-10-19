/// @desc

if (global.DEBUG){
	var warmpop_string	= "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz !#$%&()*+,-./:;<=>?@[\]^_'{|}~"
	var font				= font_add_sprite_ext(spr_warmpop_font, warmpop_string, false, 0);
	var text_color			= make_color_rgb(246,214,125);
	draw_set_font_ext(global.FONT, fa_left, fa_top, text_color, 1);
	
	var i = 0;
	var line_separation = cs/2;
	
	draw_text(0, 2 + (++i * line_separation), "Y-Speed: "		+ string(current_y_speed));
	draw_text(0, 2 + (++i * line_separation), "X-Speed: "		+ string(current_x_speed));
	draw_text(0, 2 + (++i * line_separation), "Y-Input: "		+ string(y_input));
	draw_text(0, 2 + (++i * line_separation), "X-Input: "		+ string(x_input));
	draw_text(0, 2 + (++i * line_separation), "Y-Position: "	+ string(y));
	draw_text(0, 2 + (++i * line_separation), "X-Position: "	+ string(x));
	draw_text(0, 2 + (++i * line_separation), "State: "			+ string(state));
	draw_text(0, 2 + (++i * line_separation), "Grounded: "		+ string(on_ground));
	draw_text(0, 2 + (++i * line_separation), "On-Wall: "		+ string(on_wall));
	draw_text(0, 2 + (++i * line_separation), "Wall-Left: "		+ string(wall_left));
	draw_text(0, 2 + (++i * line_separation), "State-Time: "	+ string(frames_in_state));
}
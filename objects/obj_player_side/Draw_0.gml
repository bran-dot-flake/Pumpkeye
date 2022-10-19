/// @desc

if (!visible_) {exit;}
#region debug
	if global.DEBUG {
		//player hitbox
		draw_set_color(c_lime); draw_set_alpha(1);
		draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
		
		//sword hitbox (1px offset)
		var dir = facing_direction == DIR8.right? 1: -1;
		if (facing_direction == DIR8.right){
			draw_rectangle(x +dir*10, y -11, x +dir*18, y -8,  true);	// low
			draw_rectangle(x +dir*10, y -21, x +dir*18, y -18, true);	// high
		} else{
			draw_rectangle(x +dir*19, y -11, x +dir*11, y -8,  true);
			draw_rectangle(x +dir*19, y -21, x +dir*11, y -18, true);
		}
		draw_set_color(c_white);
	}
#endregion

// flash through palette
if (flashing_timer != -1){
	pal_swap_set(pal_sprite, pal_index);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	pal_swap_reset();
	if (flashing_timer mod 2 == 0){pal_index = wrap(++pal_index, 0, sprite_get_width(pal_sprite) -1);}	// change every 2 frames (every other)
} else if (iframes_timer != -1){
	// then draw the sprite every 2 frames until iframes run out
	if (iframes_timer mod 4 <= 2){ draw_self();}
} else{ 
	// draw normal
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}

with gui_object{
	draw_set_font_ext(global.FONT, fa_left, fa_top, global.text_color, 1);
	
	// draw health and magic containers
	for (var i = 0; i < global.CURRENT_SAVE_DATA.mp_containers; i++){
		draw_sprite(spr_magic_container, 0, cx +72 +(i *8), cy +16);	
	}
	for (var i = 0; i < global.CURRENT_SAVE_DATA.hp_containers; i++){
		draw_sprite(spr_health_container, 0, cx +144 +(i *8), cy +16);	
	}
	
	// draw hp/mp pips, where each is 2 hp/mp. max hp/mp is in save data, so don't worry about it overdrawing
	for (var i = 0; i < global.CURRENT_SAVE_DATA.cur_mp; i++){
		draw_sprite(spr_magic_pip, 0, cx +39 +(i *1), cy +17);	
	}
	for (var i = 0; i < global.CURRENT_SAVE_DATA.cur_hp; i++){
		draw_sprite(spr_health_pip, 0, cx +111 +(i *1), cy +17);	
	}
	
	// draw skill levels
	draw_text(cx +16,  cy +16, string(global.CURRENT_SAVE_DATA.attack_level +1));
	draw_text(cx +80,  cy +8,  string(global.CURRENT_SAVE_DATA.magic_level  +1));
	draw_text(cx +144, cy +8,  string(global.CURRENT_SAVE_DATA.health_level +1));
	
	// draw exp to next upgrade
	var str1 = string(global.CURRENT_SAVE_DATA.cur_exp);
	var str2 = string_repeat("0", 4 -string_length(str1)) +str1;	// 4 because of string indexing, 
	draw_text(cx +176, cy +16, str2);
	str1 = string(global.CURRENT_SAVE_DATA.exp_to_next);
	str2 = string_repeat("0", 4 -string_length(str1)) +str1;
	draw_text(cx +216, cy +16, str2);

	// draw stats bar on top
	draw_sprite(spr_stats_bar, 0, cx, cy);
}

global.defaults = {
	font			: undefined,
	title			: "pumpkeye",
		
	save_file_name	: "",
	
	pal				: [make_color_rgb(247, 146, 30	), 
						make_color_rgb(177, 70, 34	),
						make_color_rgb(97, 38,	73	),
						make_color_rgb(19, 9,	18	)],
	

	intro_text1		: ["EYEBYIM AND PUMPKO ARE THE BESTEST OF FRIENDS.",
						"... UNTIL ONE DAY ... A COOL HAT LADY APPEARED.",
						"SHE OFFERED THE SWEETEST OF TREATS",
						"AND EYEBIM ACCEPTED ...",
						"BEING TAKEN ...",
						"TO THE TALLEST OF PEAKS",
						"WHERE IT WOULD BE CHURNED INTO SMELLY STEW BREW"],
						
	intro_text		: ["NIGH TO THE FLOWERING LAND OF CANDIES, THERE LIVED TWO.",
						"UNTIL ONE DAY . . . A MYSTERIOUS FIGURE EMERGED.",
						"THEIR GIFTS SWEET AND THEIR PROMISES SWEETER.",
						"EAGER, THE ONE QUICKLY SOLD AWAY WHAT WAS ONCE THEIRS.",
						"THEY WERE TAKEN AWAY, LEAVING THE OTHER NO CHANCE FOR GOODBYES.",
						"THE LONESOME SEARCHED ... UNTIL THEY FOUND WHERE THE OTHER LIE.",
						"HASTE MUST BE MADE, FOR THERE WAS NOT MUCH TIME."],
						
	parallax_y		: 180,
	transition_time	: 40,	// time to wait
	intro_palette_speed			: [1 / 40, 1 / 7], // intro, outro
	transition_palette_speed	: [1 / 7 , 1 / 7],
}


global.sounds = {
	menu_confirm	: _5_Menu_Screen_Slide_SFX_01,
	menu_back		: _5_Menu_Screen_Slide_SFX_04,
	menu_move_x		: _5_Menu_Screen_Slide_SFX_03,
	menu_move_y		: _5_Menu_Screen_Slide_SFX_01,
	menu_slide		: _5_Menu_Screen_Slide_SFX_01,
	
	mus_overworld	: mus_150,
	mus_title		: mus_before,
	mus_gameover	: noone,
	mus_gamewin		: noone,

}


global.sprites = {
	// Title
	parallax		: spr_city_extra,
	selector		: spr_selector_star,
	title			: spr_title_new,
	
	// Intro
	intro_scene		: spr_intro_scene,
	palette			: spr_pal_halloween,
	
	
}


// Save data
global.defaults.save_file_name	= string(global.defaults.title) + "_preferences" + ".sav"
global.save_data				= "";


// Font
var fnt_spr						= spr_fnt_placeholder;
var fnt_map						= " ABCDEFGHIJKLMNOPQRSTUVWXYZ!?.0123456789-"
global.defaults.font			= font_add_sprite_ext(fnt_spr, fnt_map, 1, 1);
draw_set_font					(global.defaults.font);
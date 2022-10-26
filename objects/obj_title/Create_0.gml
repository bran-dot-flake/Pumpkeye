
options = [
	["START", "QUIT"],
	["FULSCRN", "SCALE", "MASTER", "MUSIC", "SFX"],
];


enum settings_type {
	binary,
	slider,
	multiplier,
}



variables = [
	["fullscreen",		settings_type.binary	],
	["scale",			settings_type.multiplier],
	["master_volume",	settings_type.slider	],
	["mus_volume",		settings_type.slider	],
	["sfx_volume",		settings_type.slider	],
]


// Variables
buttons				= [];
global.fullscreen	= false;
selected_row		= 0;
p_selected_row		= 0;
selected_column		= 0;
p_selected_column	= 0;

selected_level		= 0;

width				= 8;

y_offset			= 0;
target_y_offset		= 0;

x_offset			= 0;
target_x_offset		= width;


initialized			= false;
sprite_index		= global.sprites.title;
index				= 0;



// Draw the indicator if selected
function draw_selector(_select, _x, _y) {
	if _select draw_sprite(global.sprites.selector, index, _x - 1, _y - 1);	
}
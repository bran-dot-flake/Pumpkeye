
sprite_index	= global.sprites.title;
y				= 56;
y_offset		= 0;
target_y_offset = -10;

width			= 0;	// line
target_width	= 200;

time			= 0;
timer			= time;

count			= 0;
text_speed		= .75;

color			= 3;
frames			= 0;
text			= "PRESS ANYKEY";


state			= 0;
play_song(global.sounds.mus_title, 1);
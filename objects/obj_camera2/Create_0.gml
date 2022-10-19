/// @desc
singleton_check();

enum CAM_MODE {
	following,
	free
}
state = CAM_MODE.free;

// init properties
	// NES display view sizes
view_width		= 256;
view_height		= 240;
aspect_ratio	= dw / dh;
max_scale		= min(3, floor(dh /view_height) );	// for in case of small monitors
//scale			= max(max_scale, 1);
scale = 3;

window_width	= view_width * scale;
window_height	= view_height * scale;
gui_width		= view_width;
gui_height		= view_height;

	// screen shake
screen_shake_ = false;
screen_shake_amount_init = 3;
screen_shake_amount = screen_shake_amount_init;

// set properties
var gui_scale = 1;	// larger is smaller gui; smaller is larger gui. In practice there will be less space to draw in but more pixels, shrinking sprites
display_set_gui_size(gui_width *gui_scale, gui_height *gui_scale);

window_set_size(window_width, window_height);
alarm[0] = 1;

var pixel_density = 1;
surface_resize(application_surface, view_width *pixel_density, view_height *pixel_density);
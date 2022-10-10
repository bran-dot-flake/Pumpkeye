var _camx = camera_get_view_x(view_camera[0]);
var _camy = camera_get_view_y(view_camera[0]);


var _camx = camera_get_view_x(view_camera[0]);
var _camy = camera_get_view_y(view_camera[0]);

var _p0 = .5;
var _p1 = .25;

draw_sprite_tiled(bg_background, 0, _camx *_p0, _camy * _p0);
draw_sprite_tiled(bg_background, 1, _camx *_p1, _camy * _p1);


closed = true;
time   = 0;



function tilemap_set_at_pixel_scale(_map, _tile_id, _x, _y, _scale) {

	for (var xoff = 0; xoff < _scale; xoff++) {
		for (var yoff = 0; yoff < _scale; yoff++) {
			tilemap_set_at_pixel(global.map, _tile_id, x + xoff * cs, y + yoff * cs);
		}
	}
	
}
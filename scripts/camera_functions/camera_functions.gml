
function camera_set_target(_obj) {
	obj_camera.target = _obj;
}


function in_screen() {
	var inx = x >= global.current_screen.x and x <= global.current_screen.x + gw;
	var iny = y >= global.current_screen.y and y <= global.current_screen.y + gh;
	
	return inx and iny
}


#macro screen global.current_screen
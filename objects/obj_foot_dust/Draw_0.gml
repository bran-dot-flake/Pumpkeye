
if age > 0
{
	// Draw Half-Circle
	draw_set_color(global.defaults.pal[1]);
	draw_primitive_begin(pr_trianglefan);
	
	// Origin
	draw_vertex(x, y + 1);
	
	// Origin + radius
	var tmes = 60;
	for (var i = 0; i < tmes; i++)
	{
		draw_vertex(x + lengthdir_x(size, 180 * i / tmes) + 1, 
					y + lengthdir_y(size, 180 * i / tmes) + 1);	
	}
	
	draw_primitive_end();
	
	
	// Draw Half-Circle
	draw_primitive_begin(pr_trianglefan);
	
	
	var sze = size * 0.6
	// Origin
	draw_vertex(x + dir * 2, y - 1);
	
	// Origin + radius
	var tmes = 100;
	for (var i = 0; i < tmes; i++)
	{
		draw_vertex(x + lengthdir_x(sze, 360 * i / tmes) + dir * 2, 
					y + lengthdir_y(sze, 360 * i / tmes) - 2);	
	}
	
	draw_primitive_end();
	draw_set_color(c_white);
	
}

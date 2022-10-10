
// Create surface
if !surface_exists(surface)
{
	surface = surface_create(gw, gh);
} 

// Draw surface
surface_set_target(surface);
	
// FIll the screen
var c = global.defaults.pal[3];
draw_clear_alpha(c, 1);
	
	
// Draw the cutout
gpu_set_blendmode(bm_subtract);
var xx = gw / 2; var yy = gh / 2;
draw_rectangle(xx - radius / 2, yy - radius / 2,
					xx + radius / 2, yy + radius / 2, 0);
						
gpu_set_blendmode(bm_normal);
	

surface_reset_target();
	
	
//  Draw the surface
draw_surface(surface, 0, 0);


pal_swap_set(global.sprites.palette, floor(global.palette_index))
draw_surface_ext(application_surface, 0, 0, global.save_data.scale, global.save_data.scale, 0, c_white, 1);
shader_reset();
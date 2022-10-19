
#region Initialize shader
	global.PAL_SHADER		= sha_palette_swap;
	global.PAL_TEXEL_SIZE	= shader_get_uniform(sha_palette_swap, "texel_size");
	global.PAL_UV			= shader_get_uniform(sha_palette_swap, "palette_UVs");
	global.PAL_INDEX		= shader_get_uniform(sha_palette_swap, "palette_index");
	global.PAL_TEXTURE		= shader_get_sampler_index(sha_palette_swap, "palette_texture");
#endregion




///@func pal_swap_set(palette_sprite_index, palette_index)
///@desc Take the given palette (first column in the palette), and swap the given sprite's colors with the given palette column
function pal_swap_set(_pal_sprite, _pal_index) {
	
	shader_set(global.PAL_SHADER);
	
	//Get information about the palette
	var _tex = sprite_get_texture(_pal_sprite,0);
	var _UVs = sprite_get_uvs(_pal_sprite,0);
	
	texture_set_stage(global.PAL_TEXTURE,_tex);
	gpu_set_texfilter_ext(global.PAL_TEXTURE,true);
	var _texel_x = texture_get_texel_width(_tex);
	var _texel_y = texture_get_texel_height(_tex);
	var _texel_hx = _texel_x * 0.5;
	var _texel_hy = _texel_y * 0.5;

	//Finalize the shader by telling it what palette to use
	shader_set_uniform_f(global.PAL_TEXEL_SIZE,_texel_x,_texel_y);
	shader_set_uniform_f(global.PAL_UV,_UVs[0] + _texel_hx,_UVs[1] + _texel_hy,_UVs[2] + _texel_hx,_UVs[3] + _texel_hy);
	shader_set_uniform_f(global.PAL_INDEX,_pal_index);
}

	

function palette_fade(_type)
{
	with obj_application_surface {
		target_palette_index = _type == transition_type.outro ? sprite_get_width(global.sprites.palette) - 1 : 1;	
		_speed = _type == transition_type.outro ? global.defaults.intro_palette_speed[1] : 	global.defaults.intro_palette_speed[0];
	}
}


function palette_fade_end()
{
	return obj_application_surface.target_palette_index == global.palette_index	
}

enum index_volume 
{
	mus,
	sfx,
}


enum depths			/// gui, ui, fx top, player, enemy, fx bot, tiles, 
{
	// Top
	gui			= -200,
	ui			= -199,
	
	// Main
	fx_top		= -100,
	instance	= 0,
	fx			= 200,
	enemy		= 300,
	
	// Bottom
	fx_bottom	= 350,
	tiles		= 400,
}


enum transition_type
{
	intro,
	outro,
}
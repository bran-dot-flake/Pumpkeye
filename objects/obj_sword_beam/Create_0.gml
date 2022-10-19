///@desc

/// variables
sprite_index = spr_sword_beam;
image_speed = 1;
beam_dir	= 0;
speed_		= 3;
life_time	= round(SEC *0.5);
damage		= global.CURRENT_SAVE_DATA.attack_level +1;		// starts at 0

/// methods
///@desc can be called upon by other objects, for instance when the beam hits an enemy
function end_me(){
	image_index  = 0;
	sprite_index = spr_sword_beam_end_effect;
}
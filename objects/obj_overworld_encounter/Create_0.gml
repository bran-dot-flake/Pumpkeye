/// @desc

#region methods
function change_state(new_state_){
	frames_in_state	= 0;
	previous_state	= state;
	state			= new_state_;
	sprite_index	= sprite[state, facing_direction];
	image_speed		= 0;
	image_index		= 0;
}

function change_state_ext(new_state_){
	change_state(new_state_);
	event_user(state); exit;
}
#endregion

#region enums
enum OVERWORLD_ENCOUNTER_STATES{
	idle	= 0,
	move	= 1
}
#endregion

#region variables
	#region animation
	sprite_index			= choose(spr_overworld_beast, spr_overworld_slime);
	image_speed				= 0;
	state					= OVERWORLD_ENCOUNTER_STATES.idle;
	previous_state			= OVERWORLD_ENCOUNTER_STATES.idle;
	frames_in_state			= 0;
	animation_length		= round(SEC *0.3);
	life_time				= SEC *3;		// affected by tile spawned on. 3 secs for grass, 12 for ...
	
	// timers
	direction_timer			= 256;
	#endregion

	#region movement
	// input
	x_input			= 0;
	y_input			= 0;
	last_x_input	= 0;
	last_y_input	= 0;
	x_motion		= 0;
	y_motion		= 0;
	
	// grid movement
	x_cell			= x div cs;
	y_cell			= y div cs;
	x_from			= x_cell;
	y_from			= y_cell;
	x_to			= x_cell;
	y_to			= y_cell;
	
	// collisions
	collision_tilemap = layer_tilemap_get_id(LAY_COLL);
	#endregion
#endregion
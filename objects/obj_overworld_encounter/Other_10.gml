///@desc idle

#region change states
if (instance_exists(obj_player_topdown)){
	var x_cell_dif_ = obj_player_topdown.x - x_cell;
	var y_cell_dif_ = y_cell -obj_player_topdown.y;
	var move_grid_  = [[1, 0], [0, -1], [-1, 0], [0, 1]];
	var move_	= [0, 0];
	
	// movement data
	if (direction_timer > 64){
		if (abs(x_cell_dif_) > 2 && abs(y_cell_dif_) > 2){
			// wander freely when far
			var dir_ = irandom(3);
			move_ = move_grid_[dir_];
		} else if (abs(y_cell_dif_) > 2){
			// "targetable" area to the player. move towards
			move_ = [0, sign2(y_cell_dif_)];
		} else if (abs(x_cell_dif_) > 2){
			move_ = [sign2(x_cell_dif_), 0];
		}
	} else{
		// wander freely when timer is almost out
		var dir_ = irandom(3);
		move_ = move_grid_[dir_];
	}
	
	// move
	if (!tilemap_get_at_pixel(collision_tilemap, x_cell +move_[0], y_cell +move_[1])){
		change_state(OVERWORLD_ENCOUNTER_STATES.move);
		x_to	+= move_[0]; 
		x_cell	= x_to;
		y_to	+= move_[1];
		y_cell	= y_to;
		event_user(state); exit;
	}
}
#endregion

#region acceleration
// none
#endregion

#region speed fractions
#endregion

#region collisions and movement
// tile movement already takes care of this
#endregion

#region animation
frames_in_state++;
#endregion

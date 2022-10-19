///@desc move
/// essentially one animation cycle, will move a cell and animate a cycle

#region change states
// idle
var time_ = min(1, frames_in_state /animation_length);
if (time_ >= 1){
	// move back to idle once time for animation comes
	change_state(OVERWORLD_ENCOUNTER_STATES.idle);
	x_from	= x_cell;
	y_from	= y_cell;
	x_to	= x_cell;
	y_to	= y_cell;
	event_user(state); exit;
}
#endregion

#region collisions and movement
x = round(lerp(x_from, x_to, time_) *cs);
x = round(lerp(y_from, y_to, time_) *cs);
#endregion

#region animation
var index_ = [0, 1];	// the frames to choose
image_index = index_[round((array_length(index_) -1) *time_)];		// 1 * 0-1, so keeps between the two subimages
frames_in_state++;
#endregion


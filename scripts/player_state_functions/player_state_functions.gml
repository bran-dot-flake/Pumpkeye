function player_state_functions()
{


// Input
function get_input()
{

	x_input		= input_held(input.Right) - input_held(input.Left);
	y_input		= input_held(input.Down)  - input_held(input.Up);
		
	jump		= input_pressed(input.Confirm);
	attack		= input_pressed(input.Deny);

}
	


// Get target movement calculations
function calculate_movement()
{
	// Horizontal and Vertical Movement
	x_speed += x_input * walk_speed
	y_speed += global.gravity;
		
	// Deccel
	x_speed = approach(x_speed, 0, deccel);
		
	// Stop
	if abs(x_speed) <= 0.1 x_speed = 0
		
	// Facing (by speed not input)
	if x_speed != 0 facing = sign(x_speed);	
		
	// Limit Speed
	x_speed = min(abs(x_speed), max_x_speed) * facing;
	y_speed = min(abs(y_speed), max_y_speed) * sign(y_speed);
		
	// Grounded and Walled
	grounded = on_ground();
	if grounded
		jumps = max_jumps;
		
	walled = on_wall();
}
	


// Get target animation calculations
function calculate_animation()
{
	//mask_index = sprite[player_states.move];
}
	


// Apply animations
function apply_animation()
{
	
	// Facing
	image_xscale = facing;
	
	
	// Add to frames
	frames++;
}
	frames++;
}
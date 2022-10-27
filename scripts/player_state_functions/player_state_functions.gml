function player_state_functions()
{


// Input
function get_input()
{

	x_input		= input_held(input.Right) - input_held(input.Left);
	y_input		= input_held(input.Down)  - input_held(input.Up);
		
	jump		= input_pressed(input.Confirm) || button_timer[input.Confirm] > 0;
	attack		= input_pressed(input.Deny);
	
	
	// Set input buffer (Just confirm for now)
	if jump input_set_buffer(input.Confirm);
}
	


// Get target movement calculations
function calculate_movement()
{
	// Horizontal and Vertical Movement
	x_speed += x_input * walk_speed
	y_speed += global.gravity;
	
	// Fast jump up
	if sign(y_speed) == -1 y_speed += global.gravity
		
	// Deccel
	x_speed = approach(x_speed, 0, deccel);
		
	// Stop
	if abs(x_speed) <= 0.1 x_speed = 0
		
	// Facing (by speed not input)
	if x_speed != 0 facing = sign(x_speed);	
		
	// Limit Speed
	x_speed = min(abs(x_speed), max_x_speed) * facing;
	y_speed = min(abs(y_speed), max_y_speed) * sign(y_speed);
}
	


// Get target animation calculations
function calculate_animation()
{
	//mask_index = sprite[player_states.move];
	
	// Grounded and Walled
	//grounded = on_ground();
	if grounded() {
		jumps = max_jumps;
		coyote_timer = coyote_time;	
	}
		
	walled = on_wall();
	
	if sign(current_x_speed) != 0 facing = sign(current_x_speed)
}
	


// Apply animations
function apply_animation()
{
	// Facing
	image_xscale = facing;
	
	
	// Add to frames
	frames++;
}



function calculate_movement_acceleration() {
	
	if x_input != 0 {
		// Different x input
		if last_x_input != x_input 
		{
			last_x_input = x_input;
			accel_final = 0;
		}
		
		if accel_final <= accel_max accel_final += accel;
		
		
	} else if accel_final > 0 accel_final -= accel;
	
	if accel_final < accel {
		accel_final = 0;
		last_x_input = 0;
	}
		
		
	x_speed = accel_final * last_x_input;
	y_speed += global.gravity;
}
	
}

if stop() exit;


// Increment Age
if age > 0 
{
	if life != undefined life--;
	if size != undefined size-= decay;
}
age++;


// Deccelerate
if x_speed != 0 x_speed *= deccel;
if y_speed != 0 y_speed *= deccel;


// Apply movement
x += x_speed;
y += y_speed;


// Die
if (life != undefined ? life <= 0 : false) or (size != undefined ? size <= 0 : false)
	instance_destroy();


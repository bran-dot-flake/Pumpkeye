
// Timers
radius = approach(radius, target_radius, _speed);
timer = approach(timer, 0, 1);
if count == 0 initialize();
count++;



// Next room / Delete
if radius == target_radius
{
	instance_destroy();
}
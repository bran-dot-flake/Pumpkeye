///@desc Fly

y -= y_speed + sin(frames / 10) * 2;
x += x_speed * facing;

if x - sprite_width > gw || x + sprite_width < 0
	instance_destroy();

frames++;
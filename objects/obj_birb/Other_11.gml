///@desc Fly

y -= y_speed + sin(frames / 10) * 2;
x += x_speed * facing;

if x - sprite_width > screen.x + gw || x + sprite_width < screen.x
	instance_destroy();

frames++;
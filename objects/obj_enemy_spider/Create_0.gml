
event_inherited();

enum spider_states {idle, move, drop}

state = spider_states.idle;

x_speed		= 0;
y_speed		= 0;
walk_speed	= 2;
drop_speed	= 1;


distance	= undefined;
facing		= undefined;


distances = {
	target	: 64,
	drop	: 32,
}


sprite[player_states.idle] = Sprite3;
sprite[spider_states.move] = Sprite3;
sprite[spider_states.drop] = Sprite3;
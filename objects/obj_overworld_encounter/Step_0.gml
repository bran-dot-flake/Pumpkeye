/// @desc

#region end life
if (life_time <= 0){ instance_destroy(); exit;}
#endregion

#region execute state, change sprite
event_user(state);
#endregion

#region position clamping
x = clamp(x, 0, room_width  -sprite_width);
y = clamp(y, 0, room_height -sprite_height);
#endregion

#region timers
if (direction_timer > -1){ approach(direction_timer, -1, 1);} else{ direction_timer = 256;}
if (life_time > -1){ approach(life_time, -1, 1);}
#endregion
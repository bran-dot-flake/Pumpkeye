/// @desc
/// spawn every time enemy dies, in the same spot

// update distance to player
distance_to_player = instance_exists(obj_player_side)?distance_to_object(obj_player_side): 0;

// spawn enemy if unassigned
if (assigned_instance == noone && distance_to_player > cs*16){
	assigned_instance = instance_create_layer(x, y, LAY_ENEMY, enemy_name); 
}

// reset assigned instance
if (assigned_instance != noone && !instance_exists(assigned_instance)){
	assigned_instance = noone;	
}
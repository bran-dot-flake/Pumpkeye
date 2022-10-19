///@desc

/// methods
///@desc sends enemies to dead state when hp is zero and creates the explosion
function take_damage(damage_){
	// boy they dead
	if (hp <= 0){ exit;}
	hp -= damage_;
	iframes = true;
	iframes_timer  = iframes_length;
	flashing_timer = flashing_length;
	// now check
	if (hp <= 0){
		switch (object_index){
			case obj_enemy_bit: state = BIT_STATES.dead;
				var inst_ = instance_create_layer(x, y, LAY_FX, obj_item_dropping_death_explosion);
				inst_.exp_ = exp_given;
			break;
			case obj_enemy_bot: state = BOT_STATES.dead;
				var inst_ = instance_create_layer(x, y, LAY_FX, obj_item_dropping_death_explosion);
				inst_.exp_ = exp_given;
			break;
			case obj_enemy_deeler: state = DEELER_STATES.dead;
				var inst_ = instance_create_layer(x, y +8, LAY_FX, obj_item_dropping_death_explosion);
				inst_.exp_ = exp_given;
			break;
			default: show_debug_message("Enemy not included in take damage script."); instance_destroy(); break;
		}
	}
}
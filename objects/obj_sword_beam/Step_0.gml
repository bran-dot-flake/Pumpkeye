
var beam_active = spr_sword_beam, beam_end = spr_sword_beam_end_effect;

switch (sprite_index){
	case beam_active:
			// round will ensure lifespan is always an integer
		if (round(life_time) == 0){ end_me();}
		life_time--;
			// create hurtbox
		var instances  = ds_list_create();
		var collisions = collision_rectangle_list(bbox_left, bbox_top, bbox_right, bbox_bottom, par_enemy, false, false, instances, false);
			// deal damage
		for (var i = 0; i < collisions; i++){
			with instances[| i]{if !iframes { take_damage(global.CURRENT_SAVE_DATA.attack_level +1);} }
		}
		ds_list_destroy(instances);
	break;
	case beam_end:
		if animation_end(){ instance_destroy();}
	break;
}
// move me baby, fly til i die yeha (yes, even for walls)
x += beam_dir *speed_;
if respawn_timer > 0 {
	respawn_timer --;
	if respawn_timer == 0 {
		sprite_index = spr_enemy_fly;
	}
}

path_speed += random(1) > 0.5 ? 0.1 : -0.1;
if path_speed < .1 path_speed = 0.1;
if path_speed > 1 path_speed = 1;
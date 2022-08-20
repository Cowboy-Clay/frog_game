if respawn_timer > 0 {
	respawn_timer --;
	if respawn_timer == 0 {
		sprite_index = spr_enemy_fly;
	}
}

path_speed += random(1) > 0.5 ? 0.25 : -0.25;
if path_speed < .5 path_speed = 0.5;
if path_speed > 2 path_speed = 2;
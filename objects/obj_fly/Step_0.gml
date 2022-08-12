if respawn_timer > 0 {
	respawn_timer --;
	if respawn_timer == 0 {
		sprite_index = spr_enemy_fly;
	}
}
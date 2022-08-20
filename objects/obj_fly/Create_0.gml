/// @description Insert description here
// You can write your code in this editor

respawn_timer = 0;

function fly_get_eaten() {
	sprite_index = noone;
	respawn_timer = respawn_time;
}

if current_path != "none" {
	path_start(Path1, 3, path_action_continue,true);
}
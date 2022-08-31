/// @description Insert description here
// You can write your code in this editor

respawn_timer = 0;

function fly_get_eaten() {
	sprite_index = noone;
	respawn_timer = respawn_time;
}

path_start(path_fly_idle, .5, path_action_continue,false);
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function egg_get_status(egg_number){
	// Ensure there is a game manager
	if variable_global_exists("game_manager") == false || global.game_manager == noone {
		instance_create_depth(0,0,0,obj_game_manager);
	}
	
	if egg_number < 1 || egg_number > 5 return noone;
	return global.egg_statuses[egg_number-1];
}
/// @description Insert description here
// You can write your code in this editor

if collision_check_edge(x,y-2,sprite_index, directions.up, [obj_frog]) {
	obj_frog.x += hspeed;
	show_debug_message("FROG");
}
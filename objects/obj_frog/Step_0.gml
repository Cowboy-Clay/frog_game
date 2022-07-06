/// @description Insert description here
// You can write your code in this editor

var bl_corner = obj_get_collision_mask_corner(id, corners.bottom_left);
var br_corner = obj_get_collision_mask_corner(id, corners.bottom_right);
grounded = tilemap_get_at_pixel(tilemap, bl_corner[0], bl_corner[1]) || tilemap_get_at_pixel(tilemap,br_corner[0], br_corner[1]);
show_debug_message(grounded);

animation_play();
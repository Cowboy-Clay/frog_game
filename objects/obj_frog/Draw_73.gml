/// @description Insert description here
// You can write your code in this editor
show_debug_message(image_xscale);

var c = obj_get_corner(id, corners.top_left);
draw_sprite_ext(spr_frog, 0, c[0], c[1], 1/32, 1/32, 0, c_black, 1);
c = obj_get_corner(id, corners.top_right);
draw_sprite_ext(spr_frog, 0, c[0], c[1], -1/32, 1/32, 0, c_black, 1);
c = obj_get_corner(id, corners.bottom_left);
draw_sprite_ext(spr_frog, 0, c[0], c[1], 1/32, -1/32, 0, c_black, 1);
c = obj_get_corner(id, corners.bottom_right);
draw_sprite_ext(spr_frog, 0, c[0], c[1], -1/32, -1/32, 0, c_black, 1);
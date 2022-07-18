/// @description Insert description here
// You can write your code in this editor

eggs_draw();
tongue_reticle_draw(20);

//var c = obj_get_collision_mask_corner(id, corners.top_left);
//draw_sprite_ext(spr_frog, 0, c[0], c[1], 1/32, 1/32, 0, c_black, 1);
//c = obj_get_corner(id, corners.top_right);
//draw_sprite_ext(spr_frog, 0, c[0], c[1], -1/32, 1/32, 0, c_black, 1);
//c = obj_get_corner(id, corners.bottom_left);
//draw_sprite_ext(spr_frog, 0, c[0], c[1], 1/32, -1/32, 0, c_black, 1);
//c = obj_get_corner(id, corners.bottom_right);
//draw_sprite_ext(spr_frog, 0, c[0], c[1], -1/32, -1/32, 0, c_black, 1);

// Draw collision mask if obj_game_manager says to
if global.show_collision_masks draw_sprite_ext(mask_index, 0,x,y,1,1,0,c_white,.5);
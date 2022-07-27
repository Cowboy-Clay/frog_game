/// @description Insert description here
// You can write your code in this editor

collision_check(collision_mask, false, false);

if collision_check_edge(x,y,sprite_index,directions.right, collision_mask) and facing == directions.right {
	facing = directions.left;
} else if collision_check_edge(x,y,sprite_index,directions.left,collision_mask) and facing == directions.left {
	facing = directions.right;
}

var bl_corner = obj_get_corner(id, corners.bottom_left);
var br_corner = obj_get_corner(id, corners.bottom_right);
var bl = collision_point_mask(bl_corner[0],bl_corner[1], collision_mask,true,true);
var br = collision_point_mask(br_corner[0],br_corner[1], collision_mask,true,true);

if ledge_detection {
	if bl and !br and facing == directions.right{
		facing = directions.left;
	} else if br and !bl and facing == directions.left {
		facing = directions.right;
	}
}
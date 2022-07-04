// Given an object, return the coordinates of a specific corner
function obj_get_corner(obj, corner){
	var scale_x = obj.image_xscale;
	var scale_y = obj.image_yscale;
	var offset_x = obj.sprite_index.sprite_xoffset;
	var offset_y = obj.sprite_index.sprite_yoffset;
	var width = obj.sprite_index.sprite_width;
	var height = obj.sprite_index.sprite_height;
	
	var corner_position = [0,0];
	
	show_debug_message(scale_y);
	show_debug_message(offset_y);
	show_debug_message(height);
	
	switch (corner) {
		case corners.top_left:
			if scale_x >= 0 {
				corner_position[0] = obj.x - (offset_x);
			} else {
				corner_position[0] = obj.x - (offset_x) + width;
			}
			if scale_y >= 0 {
				corner_position[1] = obj.y - (offset_y);
			} else {
				corner_position[1] = obj.y - (offset_y) + (height);
			}
			return corner_position;
			break;
		case corners.top_right:
			if scale_x >= 0 {
				corner_position[0] = obj.x - offset_x + width;
			} else {
				corner_position[0] = obj.x - offset_x;
			}
			if scale_y >= 0 {
				corner_position[1] = obj.y - (offset_y);
			} else {
				corner_position[1] = obj.y - (offset_y) + (height);
			}
			return corner_position;
			break;
		case corners.bottom_left:
			if scale_x >= 0 {
				corner_position[0] = obj.x - (offset_x);
			} else {
				corner_position[0] = obj.x - (offset_x) + width;
			}
			if scale_y >= 0 {
				corner_position[1] = obj.y - (offset_y) + (height);
			} else {
				corner_position[1] = obj.y - (offset_y);
			}
			return corner_position;
			break;
		case corners.bottom_right:
			if scale_x >= 0 {
				corner_position[0] = obj.x - offset_x + width;
			} else {
				corner_position[0] = obj.x - offset_x;
			}
			if scale_y >= 0 {
				corner_position[1] = obj.y - (offset_y) + (height);
			} else {
				corner_position[1] = obj.y - (offset_y);
			}
			return corner_position;
			break;
	}
	return noone;
}
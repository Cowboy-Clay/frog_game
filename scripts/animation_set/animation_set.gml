function animation_set(animation_to_use, fps_to_use, animation_type_to_use){
	// create variables if they do not exist
	if variable_instance_exists(id, "animation_type_current") == false {
		animation_type_current = animation_type.first_frame;
	}
	if variable_instance_exists(id, "animation_fps_current") == false {
		animation_fps_current = 60;
	}
	if variable_instance_exists(id,"animation_frame_counter") == false {
		animation_frame_counter = 0;
	}
	
	if sprite_index == animation_to_use &&
	animation_fps_current == fps_to_use &&
	animation_type_current == animation_type_to_use {
		return;
	}
	
	sprite_index = animation_to_use;
	animation_fps_current = fps_to_use;
	animation_type_current = animation_type_to_use;
	animation_frame_counter = 0;
}
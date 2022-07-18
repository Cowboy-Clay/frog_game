function tongue_reticle_draw(distance){
	if variable_instance_exists(id, "tongue_reticle_angle") == false return;
	
	var theta = tongue_reticle_angle * pi / 180;
	show_debug_message(tongue_reticle_angle);
	show_debug_message(theta);
	var rise = sin(theta) * distance;
	var run = cos(theta) * distance;
	
	if variable_instance_exists(id, "tongue_reticle_visible_position") == false {
		tongue_reticle_visible_position = [player_tongue_offset_x*image_xscale+run, player_tongue_offset_y*image_yscale+rise];
	}
	var target_position = [player_tongue_offset_x*image_xscale+run,player_tongue_offset_y*image_yscale+rise];
	
	if typeof(player_tongue_angle_min) == "number" or typeof(player_tongue_angle_max) == "number" {
		target_position[0] = player_tongue_offset_x*image_xscale + run*sign(image_xscale);
	}
	
	tongue_reticle_visible_position[0] = lerp(tongue_reticle_visible_position[0], target_position[0], player_tongue_reticle_lerp_value);
	tongue_reticle_visible_position[1] = lerp(tongue_reticle_visible_position[1], target_position[1], player_tongue_reticle_lerp_value);
	
	draw_sprite(player_tongue_reticle,0,x+ tongue_reticle_visible_position[0], y + tongue_reticle_visible_position[1]);
}
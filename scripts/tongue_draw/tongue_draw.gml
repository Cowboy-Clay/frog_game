function tongue_draw(){
	if variable_instance_exists(id, "tongue_timer") == false return;
	
	var xx = x + image_xscale * player_tongue_offset_x;
	var yy = y + image_yscale * player_tongue_offset_y;
	var ww = sprite_get_width(player_tongue_sprite);
	
	if tongue_timer > 0 and tongue_timer < player_tongue_frames_extend + player_tongue_frames_retract {
		var l = tongue_get_length();
		var ll = l / ww;
		var a = -tongue_reticle_angle;
		if image_xscale < 0 {
			if a == 0 a = 180;
			else if a > 0 a = 180-a;
			else if a  < 0 a =  -180 -a;
		}
		draw_sprite_ext(player_tongue_sprite, 0, xx, yy, ll, 1, a, c_white, 1);	
	}
}
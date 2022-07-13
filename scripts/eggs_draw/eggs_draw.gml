function eggs_draw(){
	// Variables used in drawing the eggs
	// The offset of each egg
	var egg_offsets = [
		[0,0],
		[0,0],
		[0,0],
		[0,0],
		[0,0],
	];
	// Healthy egg sprite
	var egg_sprite = spr_egg;
	// Damaged egg sprite
	var egg_sprite_damaged = spr_egg_damaged;

	// go through each egg 1 to 5
	for (var i = 1; i <= 5; i ++) {
		var current_egg_status = egg_get_status(i);
		if current_egg_status == egg_status.missing continue;
		
		var current_egg_sprite = noone;
		switch current_egg_status {
			case egg_status.missing:	// The egg is not there and should be skipped
				continue;
				break;
			case egg_status.healthy:	// Select the healthy egg sprite
				current_egg_sprite = egg_sprite;
				break;
			case egg_status.damaged:	// Select the damaged egg sprite
				current_egg_sprite = egg_sprite_damaged;
				break;
		}
		// If somehow the egg sprite has not been set but the egg wasn't marked as missing we just skip to the next egg
		if current_egg_sprite == noone continue;
		
		// Figure out the current offset that should be used
		var current_offset = egg_offsets[i-1];
		current_offset[0] *= image_xscale;
		current_offset[1] *= image_yscale;
		
		// Draw the egg
		draw_sprite(current_egg_sprite, 0, x+current_offset[0], y+current_offset[1]);
	}
}
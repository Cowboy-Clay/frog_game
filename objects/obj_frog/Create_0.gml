//tilemap = layer_tilemap_get_id(tilemap_name);

collision_mask = [obj_tile_collision];

walk_acceleration = 2;
walk_speed_max = 3;

// Set default animation
animation_set(global.animation_frog_idle);

function walk() {
	if variable_instance_exists(id, "grounded") == false {
		grounded = collision_check_edge(x, y, mask_index, directions.down, collision_mask); 
	}
	if !grounded return;
	if input_check(input_action.left) && !input_check(input_action.right){
		hspeed -= walk_acceleration;
	} else if input_check(input_action.right) && !input_check(input_action.left) {
		hspeed += walk_acceleration;
	}
}

function walk_apply_limit() {
	if abs(hspeed) > walk_speed_max {
		hspeed = sign(hspeed) * walk_speed_max;
	}
}

function animation_select() {
	
}
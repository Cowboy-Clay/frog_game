//tilemap = layer_tilemap_get_id(tilemap_name);

collision_mask = [obj_tile_collision];

walk_acceleration = 2;
walk_speed_max = 2;

// Jump stuff
jump_timer = 0; // Frame counter to determine how long the player is preparing their jump
#macro player_jump_windup_min 3
#macro player_jump_windup_max 30
#macro player_jump_force_vertical_min 3.5
#macro player_jump_force_vertical_max 5.5
#macro player_jump_force_horizontal_min 3.5
#macro player_jump_force_horizontal_max 4
#macro jump_buffer_length 13

// Tongue stuff
tongue_reticle_angle = 0;
#macro player_tongue_angle_acceloration -4.9
#macro player_tongue_reticle spr_placeholder_reticle
#macro player_tongue_offset_x 13
#macro player_tongue_offset_y 6
#macro player_tongue_angle_min -88
#macro player_tongue_angle_max 88
#macro player_tongue_reticle_lerp_value 0.3

// Set default animation
animation_set(global.animation_frog_idle);

function walk() {
	if jump_timer > 0 return;
	if variable_instance_exists(id, "grounded") == false {
		grounded = collision_check_edge(x, y, mask_index, directions.down, collision_mask); 
	}
	if !grounded return;
	if input_check(input_action.left) && !input_check(input_action.right){
		hspeed -= walk_acceleration;
		image_xscale = -1;
	} else if input_check(input_action.right) && !input_check(input_action.left) {
		hspeed += walk_acceleration;
		image_xscale = 1;
	}
}

function walk_apply_limit() {
	if abs(hspeed) > walk_speed_max {
		hspeed = sign(hspeed) * walk_speed_max;
	}
}

function animation_select() {
	
}

function GoToPlayerJumpAnti()
{
	if jump_timer >= 0 jump_timer = -1 * jump_buffer_length;
	else jump_timer ++;
	if jump_timer < 0 && grounded jump_timer = 1;
	show_debug_message(jump_timer);
}
function GoToPlayerJump()
{
	if !grounded return;
    var l = jump_timer - player_jump_windup_min;
    l = l / (player_jump_windup_max - player_jump_windup_min);
    vspeed -= lerp(player_jump_force_vertical_min, player_jump_force_vertical_max, l);
    if input_check(input_action.right) && !input_check(input_action.left)
    {
        hspeed = lerp(player_jump_force_horizontal_min, player_jump_force_horizontal_max , l);
    }
    else if !input_check(input_action.right) && input_check(input_action.left)
    {
        hspeed = -lerp(player_jump_force_horizontal_min, player_jump_force_horizontal_max, l);
    }
	jump_timer = 0;
}
function PlayerJumpAnti()
{
	if !grounded {
		jump_timer = 0;
		return;
	}
    jump_timer += 1;
    if jump_timer > player_jump_windup_max || (jump_timer > player_jump_windup_min && keyboard_check(ord("X")) == false)
    {
        GoToPlayerJump();
    }
}

function tongue_aim() {
	if input_check(input_action.up) and not input_check(input_action.down) {
		tongue_reticle_angle += player_tongue_angle_acceloration;
	} else if input_check(input_action.down) and not input_check(input_action.up) {
		tongue_reticle_angle -= player_tongue_angle_acceloration;
	}
	while tongue_reticle_angle >= 180 tongue_reticle_angle -= 360;
	while tongue_reticle_angle < -180 tongue_reticle_angle += 360;
	
	if typeof(player_tongue_angle_min) == "number" {
		tongue_reticle_angle = tongue_reticle_angle < player_tongue_angle_min ? player_tongue_angle_min : tongue_reticle_angle;
	}
	if typeof(player_tongue_angle_max) == "number" {
		tongue_reticle_angle = tongue_reticle_angle > player_tongue_angle_max ? player_tongue_angle_max : tongue_reticle_angle;
	}
}
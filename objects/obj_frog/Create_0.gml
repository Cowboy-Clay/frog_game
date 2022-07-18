//tilemap = layer_tilemap_get_id(tilemap_name);

collision_mask = [obj_tile_collision];

walk_acceleration = 2;
walk_speed_max = 1;

jumpTimer = 0; // Frame counter to determine how long the player is preparing their jump
global.player_minJumpWindup = 3; // the min # of frames the player can prepare a jump
global.player_maxJumpWindup = 30; // the max # of frames the player can prepare a jump
global.player_minVertJumpForce = 2; // min vertical force applied by a jump
global.player_maxVertJumpForce = 3; // max vertical force applied by a jump
global.player_minHoriJumpForce = 2; // min horizontal force applied by a jump
global.player_maxHoriJumpForce = 5; // max horizontal force applied by a jump
#macro jump_buffer_length 13

// Set default animation
animation_set(global.animation_frog_idle);

function walk() {
	if jumpTimer > 0 return;
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
	if jumpTimer >= 0 jumpTimer = -1 * jump_buffer_length;
	else jumpTimer ++;
	if jumpTimer < 0 && grounded jumpTimer = 1;
	show_debug_message(jumpTimer);
}
function GoToPlayerJump()
{
	if !grounded return;
    var l = jumpTimer - global.player_minJumpWindup;
    l = l / (global.player_maxJumpWindup - global.player_minJumpWindup);
    vspeed -= lerp(global.player_minVertJumpForce, global.player_maxVertJumpForce, l);
    if input_check(input_action.right) && !input_check(input_action.left)
    {
        hspeed = lerp(global.player_minHoriJumpForce, global.player_maxHoriJumpForce, l);
    }
    else if !input_check(input_action.right) && input_check(input_action.left)
    {
        hspeed = -lerp(global.player_minHoriJumpForce, global.player_maxHoriJumpForce, l);
    }
	jumpTimer = 0;
}
function PlayerJumpAnti()
{
	if !grounded {
		jumpTimer = 0;
		return;
	}
    jumpTimer += 1;
    if jumpTimer > global.player_maxJumpWindup || (jumpTimer > global.player_minJumpWindup && keyboard_check(ord("X")) == false)
    {
        GoToPlayerJump();
    }
}

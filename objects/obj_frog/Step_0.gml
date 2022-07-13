/// @description Insert description here
// You can write your code in this editor

physics_gravity(0.1,10);

walk();
physics_friction(grounded ? .8 : 0);
walk_apply_limit();

if input_check_pressed(input_action.jump) && jumpTimer == 0 {
	show_debug_message("Starting jump charge");
	GoToPlayerJumpAnti();
} else if jumpTimer > 0 {
	if (input_check(input_action.jump) == false && jumpTimer > global.player_minJumpWindup) || ( jumpTimer > global.player_maxJumpWindup) {
		GoToPlayerJump();
	} else {
		PlayerJumpAnti();
	}
}

if jumpTimer > 0 {
	animation_set(global.animation_frog_jumpAnti);
}
if !grounded {
	if vspeed > 0 animation_set(global.animation_frog_falling);
	else animation_set(global.animation_frog_jump);
}
if grounded && abs(hspeed) > 0.3 animation_set(global.animation_frog_walk);
if grounded && jumpTimer == 0 && abs(hspeed) < 0.3 && abs(vspeed) < 0.3 animation_set(global.animation_frog_idle);
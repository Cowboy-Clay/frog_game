/// @description Insert description here
// You can write your code in this editor

physics_gravity(0.1,10);

walk();
physics_friction(grounded ? .8 : .1);
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
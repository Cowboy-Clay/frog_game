/// @description Insert description here
// You can write your code in this editor


walk();

// Tongue shooting physics
if (tongue_timer > 0 and tongue_timer < player_tongue_frames_extend){
	physics_gravity(0.1,1);
	physics_friction(grounded ? .5 : 0);
}
// Water physics
else if place_meeting(x,y, obj_water) {
	physics_gravity(0.1, 0.1);
	physics_friction(grounded ? .8 : .5);
}
// Standard physics
else {
	physics_gravity(0.2,10);
	physics_friction(grounded ? .5 : 0);
}


if grounded or place_meeting(x,y, obj_water) walk_apply_limit();


if grounded && tongue_ready == false and tongue_timer == 0 {
	tongue_ready = true;
}

// Jump logic
// If you are trying to start a jump
if (input_check_pressed(input_action.jump) && jump_timer == 0) || jump_timer < 0{
	show_debug_message("Starting jump charge");
	GoToPlayerJumpAnti();
} 
// else if a jump is already being processed
else if jump_timer > 0 {
	if (input_check(input_action.jump) == false && jump_timer > player_jump_windup_min) || ( jump_timer > player_jump_windup_max) {
		GoToPlayerJump();
	} else {
		PlayerJumpAnti();
	}
}

tongue_aim();
tongue_fire();
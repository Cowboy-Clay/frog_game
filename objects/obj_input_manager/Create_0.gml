function input_update() {
	// up
	var _up_old = global.input_up_value;
	var _up_new = input_check(input_action.up);
	global.input_up_value = _up_new;
	global.input_up_pressed_value = !_up_old && _up_new;
	global.input_up_released_value = _up_old && !_up_new;
	// down
	var _down_old = global.input_down_value;
	var _down_new = input_check(input_action.down);
	global.input_down_value = _down_new;
	global.input_down_pressed_value = !_down_old && _down_new;
	global.input_down_released_value = _down_old && !_down_new;
	// left
	var _left_old = global.input_left_value;
	var _left_new = input_check(input_action.left);
	global.input_left_value = _left_new;
	global.input_left_pressed_value = !_left_old && _left_new;
	global.input_left_released_value = _left_old && !_left_new;
	// right
	var _right_old = global.input_right_value;
	var _right_new = input_check(input_action.right);
	global.input_right_value = _right_new;
	global.input_right_pressed_value = !_right_old && _right_new;
	global.input_right_released_value = _right_old && !_right_new;
	// attack
	var _attack_old = global.input_attack_value;
	var _attack_new = input_check(input_action.attack);
	global.input_attack_value = _attack_new;
	global.input_attack_pressed_value = !_attack_old && _attack_new;
	global.input_attack_released_value = _attack_old && !_attack_new;
	// jump
	var _jump_old = global.input_jump_value;
	var _jump_new = input_check(input_action.jump);
	global.input_jump_value = _jump_new;
	global.input_jump_pressed_value = !_jump_old && _jump_new;
	global.input_jump_released_value = _jump_old && !_jump_new;
	// sling
	var _sling_old = global.input_sling_value;
	var _sling_new = input_check(input_action.sling);
	global.input_sling_value = _sling_new;
	global.input_sling_pressed_value = !_sling_old && _sling_new;
	global.input_sling_released_value = _sling_old && !_sling_new;
	// face
	var _face_old = global.input_face_value;
	var _face_new = input_check(input_action.face);
	global.input_face_value = _face_new;
	global.input_face_pressed_value = !_face_old && _face_new;
	global.input_face_released_value = _face_old && !_face_new;
	// block
	var _block_old = global.input_block_value;
	var _block_new = input_check(input_action.block);
	global.input_block_value = _block_new;
	global.input_block_pressed_value = !_block_old && _block_new;
	global.input_block_released_value = _block_old && !_block_new;
	// kick
	var _kick_old = global.input_kick_value;
	var _kick_new = input_check(input_action.kick);
	global.input_kick_value = _kick_new;
	global.input_kick_pressed_value = !_kick_old && _kick_new;
	global.input_kick_released_value = _kick_old && !_kick_new;
	// menu
	var _menu_old = global.input_menu_value;
	var _menu_new = input_check(input_action.menu);
	global.input_menu_value = _menu_new;
	global.input_menu_pressed_value = !_menu_old && _menu_new;
	global.input_menu_released_value = _menu_old && !_menu_new;
}

input_update();

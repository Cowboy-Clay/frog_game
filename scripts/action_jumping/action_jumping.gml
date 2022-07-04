function action_jumping(){ // always goes above start_jump function
	if (float_up) {
		if (jumping) vspeed -= float_mod;
	} else {
		if (jumping and vspeed > 0) vspeed -= float_mod;
	}

	if (grounded and jumping) {
		land_effect();
		jumping = false;
	}
}
		
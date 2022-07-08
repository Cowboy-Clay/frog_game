function action_walk(acceleration, dir, limit){
	hspeed += acceleration*dir;
	if (abs(hspeed) > limit) hspeed = limit*sign(dir);
}
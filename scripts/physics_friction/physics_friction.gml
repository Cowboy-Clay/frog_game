// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function physics_friction(f_val){
	if hspeed > 0
	{
		hspeed -= f_val;
		if hspeed < 0 hspeed = 0;
	}
	else if hspeed < 0
	{
		hspeed += f_val;
		if hspeed > 0 hspeed = 0;
	}
}
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function on_ground(){
	if collision_check_edge(x,y,colSpr, Direction.DOWN, collMask) {
		return true;
	}
	return false;
}
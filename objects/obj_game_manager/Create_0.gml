/// @description Declarations which should be used across the game

// Declare self as the global instance and destroy self if an instance already exists
if !variable_global_exists("game_manager") {
	global.game_manager = id;
} else {
	if global.game_manager != id instance_destroy(id);
}

#region Egg status
enum egg_status {healthy, damaged, missing};
global.egg_statuses = [egg_status.missing,
					   egg_status.missing,
					   egg_status.missing,
					   egg_status.missing,
					   egg_status.missing];
					   
function egg_collect(){
	for (var i = 0 ; i < 5 ; i++) {
		if global.egg_statuses[i] == egg_status.missing {
			global.egg_statuses[i] = egg_status.healthy;
			return true;
		}
	}
	return false;
}
#endregion

#region Debugging
global.show_collision_masks = false;
#endregion
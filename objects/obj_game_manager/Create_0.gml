/// @description Declarations which should be used across the game

// Declare self as the global instance and destroy self if an instance already exists
if !variable_global_exists("game_manager") {
	global.game_manager = id;
} else {
	if global.game_manager != id instance_destroy(id);
}

#region Egg status
enum egg_status {healthy, damaged, missing};
global.egg_statuses = [egg_status.healthy,egg_status.healthy,egg_status.healthy,egg_status.healthy,egg_status.healthy];
#endregion

#region Debugging
global.show_collision_masks = false;
#endregion
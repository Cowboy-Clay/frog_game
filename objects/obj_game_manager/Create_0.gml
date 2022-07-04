/// @description Declarations which should be used across the game

// Declare self as the global instance and destroy self if an instance already exists
if !variable_global_exists("game_manager") {
	global.game_manager = id;
} else {
	if global.game_manager != id instance_destroy(id);
}
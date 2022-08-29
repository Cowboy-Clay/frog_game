/// @description Insert description here
// You can write your code in this editor

var grounded_last = grounded;
collision_check(collision_mask,wall_bouncy_factor,false);
if not grounded_last and grounded audio_play_sound(sfx_frog_land, 50, false);
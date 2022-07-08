//x_offset = -800;
//y_offset = -720;

obj_player = obj_frog;

cam = view_camera[0];

x = obj_player.x;
y = obj_player.y;

cam_width = camera_get_view_width(cam);
cam_height = camera_get_view_height(cam);

shake = -1;
min_mag = 0;
max_mag = 0;

if instance_exists(obj_cam_anchor)
{
	if place_meeting(x,y,obj_cam_anchor)
	{
		a = instance_nearest(x,y,obj_cam_anchor);
		x = a.x;
		y = a.y;
	}
}

camera_set_view_pos(cam,x-camera_get_view_width(cam)/2,y-camera_get_view_height(cam)/2);

function camera_shake(_time, _min_magnitude, _max_magnitude) {
	shake = _time;
	min_mag = _min_magnitude;
	max_mag = _max_magnitude;
}

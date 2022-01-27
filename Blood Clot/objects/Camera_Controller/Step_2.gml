/// @description 

camera_set_view_size(view_camera[0],view_width,view_height);

if(instance_exists(obj_player))
{
	camera_set_view_target(view_camera[0],obj_player);
	camera_set_view_speed(view_camera[0],12,12);
	camera_set_view_border(view_camera[0],240,120);
}


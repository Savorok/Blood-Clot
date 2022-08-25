/// @description Update camera controler view properties
//if applicable update camera gui
if(instance_exists(imgui_cameras))
{
	imgui_cameras.view_w = 	camera_get_view_width(view_camera[0]);
	imgui_cameras.view_h = 	camera_get_view_height(view_camera[0]);
}
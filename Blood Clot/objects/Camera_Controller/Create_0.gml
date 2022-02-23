///@description Init camera variables

//view and window sizes
view_width = 640;
view_height = 360;
window_width = 1920;
window_height = 1080;

//shaking
shaking = false;

//zooming
zoom = false;

//set window size
window_set_size(window_width,window_height);

//centre window
alarm[0] = 1;

//resize surface
surface_resize(application_surface,window_width,window_height)

//if player exists and no camera make one
if(instance_exists(obj_player))
{
	if(!instance_exists(obj_player_camera))
	{
		instance_create_depth(obj_player.x,obj_player.y,1,obj_player_camera);
	}
}
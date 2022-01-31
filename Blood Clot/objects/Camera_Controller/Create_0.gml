///@description Init camera variables

//view and window sizes
view_width = 640;
view_height = 360;
window_width = 1920;
window_height = 1080;

//shaking
shake_amount = 10;
shaking = false;

//zooming
zoom = false;

zoom_w = 25.6;
zoom_h = 14.4;
max_zoom_width = 128;
max_zoom_height = 72;
return_time = 2;

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
///@description Init camera variables


//view and window sizes
view_width = 640;
view_height = 360;
window_width = 1920;
window_height = 1080;

cur_aspect_ratio = 2;
cur_resoloution = 3;
cur_fullscreen = 1;
cur_active_camera = obj_player_camera;

//shaking
shaking = false;
//zooming
zoom = false;

//if player exists and no camera make one
if(instance_exists(obj_player))
{
	if(!instance_exists(obj_player_camera))
	{
		instance_create_layer(obj_player.x,obj_player.y,"Controllers",obj_player_camera);
	}
}

//set window size
window_set_size(window_width,window_height);

//centre window
alarm[0] = 1;

//resize surface
surface_resize(application_surface,window_width,window_height)

//
window_set_fullscreen(cur_fullscreen);
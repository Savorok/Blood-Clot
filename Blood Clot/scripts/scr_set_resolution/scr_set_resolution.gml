/// Set the resolution of the game window to the given values
function scr_set_resolution(_window_width,_window_height)
{
	//update the camera controllers resolution variables
	Camera_Controller.window_width = _window_width;
	Camera_Controller.window_height = _window_height;
	
	//set the new window resolution
	window_set_size(_window_width,_window_height);
	surface_resize(application_surface,_window_width,_window_height);
	
	//resize the surfaces
	if(surface_exists(Blood_Controller.surface_blood)){surface_resize(Blood_Controller.surface_blood,_window_width,_window_height);}
	if(surface_exists(obj_water.waterSurface)){surface_resize(obj_water.waterSurface,_window_width,_window_height);}
	
	//if we arnt in fullscreen, centre the window
	if(!Camera_Controller.cur_fullscreen)
	{
		Camera_Controller.alarm[0] = 1;	
	}
}
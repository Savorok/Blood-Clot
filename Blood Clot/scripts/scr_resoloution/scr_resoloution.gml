#region scr_resoloution input values
/*
/ [Aspect Ratios]
/ | 1: 4:3      |
/ | 2: 16:9     |
/ | 3: 43:18    |
/ [-------------]
/
/ [Resoloutions]
/ |[4:3]:      |
/ |	1:640*480  |
/ | 2:800*600  |
/ | 3:1920*1440|
/ |[16:9]:     |
/ |	1:1280*720 |
/ | 2:1920*1080|
/ | 3:3840*2160|
/ |[43:18]:    |
/ |	1:860*360  |
/ | 2:1720*720 |
/ | 3:3440*1440|
/ [------------]
*/
#endregion
function scr_resoloution(aspect_ratio, resoloution, cur_camera, fullscreen)
{
	//get initial variables
	var h_res = Camera_Controller.window_height;
	var w_res = Camera_Controller.window_width;
	var h_view = Camera_Controller.view_height;
	var w_view = Camera_Controller.view_width;
	
	switch(aspect_ratio)
	{
		#region 4:3
		case 0:
			w_view = 640;
			h_view = 480;
			switch(resoloution)
			{
				//640*480
				case 0:
				w_res = 640;
				h_res = 480;
					break;
				
				//800*600
				case 1:
				w_res = 800;
				h_res = 600;
					break;
					
				//1920*1440
				case 2:
				w_res = 1920;
				h_res = 1440;
					break;
			}
			break;
		
		#endregion
		
		#region 16:9
		
		//16:9
		case 1:
			w_view = 640;
			h_view = 360;
			switch(resoloution)
			{
				//1280*720
				case 0:
					w_res = 1280;
					h_res = 720;
					break;
				
				//1920*1080
				case 1:
					w_res = 1920;
					h_res = 1080;
					break;
					
				//3840*2160
				case 2:
					w_res = 3840;
					h_res = 2160;
					break;
			}
			break;			
		#endregion
		
		#region 43:18
		case 2:
			w_view = 1075;
			h_view = 450;
			switch(resoloution)
			{
				//860*360
				case 0:
					w_res = 860;
					h_res = 360;
					break;
				//1720*720
				case 1:
					w_res = 1720;
					h_res = 720;
					break;		
				//3440*1440
				case 2:
					w_res = 3440;
					h_res = 1440;
					break;
			}
			break;
		
		#endregion
				
		default:
			if(instance_exists(Imgui_dev_menu))
			{
				Imgui_console.logConsole("[err]","Invalid aspect ratio")
			}
			break;
	}
	
	//update the view
	cur_camera.view_width = w_view;
	cur_camera.view_height = h_view;
	
	//update camera controller
	Camera_Controller.view_width = w_view;
	Camera_Controller.view_height = h_view;
	Camera_Controller.window_width = w_res;
	Camera_Controller.window_height = h_res;
	
	//set the new window size
	window_set_size(w_res,h_res);
	
	surface_resize(application_surface,w_res,h_res);
	//if blood surface is there resize
	if(surface_exists(Blood_Controller.surface_blood)){surface_resize(Blood_Controller.surface_blood,w_res,h_res);}
	if(surface_exists(obj_water.waterSurface)){surface_resize(obj_water.waterSurface,w_res,h_res);}
	
	//fullscreen
	if(fullscreen){ window_set_fullscreen(true); }
	else 
	{ 
		window_set_fullscreen(false);	
		//centre window if not fullscreen
		Camera_Controller.alarm[0] = 1;	
	}
	
	//update camera controller variables
	Camera_Controller.cur_aspect_ratio = aspect_ratio;
	Camera_Controller.cur_resoloution = resoloution;
	Camera_Controller.cur_active_camera = cur_camera;
	Camera_Controller.cur_fullscreen = fullscreen;
	
	
	
}
	
function scr_resoloution_custom(cur_camera,window_width, window_height, fullscreen)
{	
	//update camera controller
	Camera_Controller.window_width = window_width;
	Camera_Controller.window_height = window_height;
	
	//set the new window size
	window_set_size(window_width,window_height);
	surface_resize(application_surface,window_width,window_height);
	//if blood surface is there resize
	if(surface_exists(Blood_Controller.surface_blood)){surface_resize(Blood_Controller.surface_blood,window_width,window_height);}
	if(surface_exists(obj_water.waterSurface)){surface_resize(obj_water.waterSurface,window_width,window_height);}
	
	//fullscreen
	if(fullscreen){ window_set_fullscreen(true); }
	else 
	{ 
		window_set_fullscreen(false);	
	}
	Camera_Controller.alarm[0] = 1;	
}

function scr_view_custom(cur_camera,view_width,view_height)
{
	//update the view
	cur_camera.view_width = view_width;
	cur_camera.view_height = view_height;
	
	//update camera controller
	Camera_Controller.view_width = view_width;
	Camera_Controller.view_height = view_height;
}

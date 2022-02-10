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
		
		default:
		show_debug_message("Invalid Aspect Ratio");
			break;
	}
	
	//update the view
	cur_camera.view_width = w_view;
	cur_camera.view_height = h_view;
	Camera_Controller.view_width = w_view;
	Camera_Controller.view_height = h_view;
	
	//print width and height to console
	show_debug_message("View Width:" + string(w_view) + " View Height:" + string(h_view) + "\n");
	show_debug_message("Window Width:" + string(w_res) + " Window Height:" + string(h_res));
	
	//set the new window size
	window_set_size(w_res,h_res);
	surface_resize(application_surface,w_res,h_res);
	//if blood surface is there resize
	if(surface_exists(Blood_Controller.surface_blood))
	{
		surface_resize(Blood_Controller.surface_blood,w_res,h_res);
	}
	
	//fullscreen
	if(fullscreen){ window_set_fullscreen(true); }
	else 
	{ 
		window_set_fullscreen(false);	
	}
	
	Camera_Controller.alarm[0] = 1;	
}
	
	

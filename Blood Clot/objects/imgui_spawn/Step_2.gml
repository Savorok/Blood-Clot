/// @description 

#region close if needed

if(!instance_exists(imgui)){exit;}
if(!imguigml_ready()){exit;}

#endregion

#region get camera variables

//var camera_properties = [];
if(instance_exists(obj_player))
{
	
}

#endregion

//activate the initial window 
imguigml_set_next_window_size(menu_width, menu_height, EImGui_Cond.Once);
var camera_window = imguigml_begin("Camera Window",true);
	
//set window scale and display mode
imguigml_set_display_mode(EImGui_DisplayMode.GUIAspect)
imguigml_set_display_scale(scale,scale);

if(camera_window[0] )
{
		
	//close window if needed
	if(!camera_window[1])
	{
		instance_destroy();	
	}
}

imguigml_end();
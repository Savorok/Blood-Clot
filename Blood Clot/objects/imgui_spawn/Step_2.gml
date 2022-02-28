/// @description 

#region close if needed

if(!instance_exists(imgui)){exit;}
if(!imguigml_ready()){exit;}

#endregion

//activate the initial window 
imguigml_set_next_window_size(menu_width, menu_height, EImGui_Cond.Once);
var spawn_window = imguigml_begin("Spawn Window",true);
	
//set window scale and display mode
imguigml_set_display_mode(EImGui_DisplayMode.GUIAspect)
imguigml_set_display_scale(scale,scale);

if(spawn_window[0])
{
		
	//close window if needed
	if(!spawn_window[1])
	{
		instance_destroy();	
	}
}

imguigml_end();
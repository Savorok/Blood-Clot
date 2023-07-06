/// @description 

#region close if needed

if(!instance_exists(imgui)){exit;}
if(!imguigml_ready()){exit;}

#endregion

//activate the initial window 
imguigml_set_next_window_size(menu_width, menu_height, EImGui_Cond.Once);
var level_window = imguigml_begin("Level Window",true);
	
//set window scale and display mode
imguigml_set_display_mode(EImGui_DisplayMode.GUIAspect)
imguigml_set_display_scale(scale,scale);

if(level_window[0])
{
	#region grid and debug masks

	imguigml_text("Enable Ghost:");
	imguigml_push_item_width(32);
	imguigml_pop_item_width();
	imguigml_same_line(); 
	var ckbox_ghost_enabled = imguigml_checkbox("", ghost_enabled);
	if(ckbox_ghost_enabled[0])
	{			
		ghost_enabled = ckbox_ghost_enabled[1];
		Level_Controller.ghost_enabled = ckbox_ghost_enabled[1];
	}
	
	imguigml_separator();
	
	#endregion
	
	//close window if needed
	if(!level_window[1])
	{
		instance_destroy();	
	}
}

imguigml_end();
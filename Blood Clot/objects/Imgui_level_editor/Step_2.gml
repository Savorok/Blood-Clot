/// @description get menu ready and draw it

if(imguigml_ready())
{
	if(level_editor)
	{
		//activate the initial window 
		imguigml_set_next_window_size(menu_width, menu_height, EImGui_Cond.Once);
		var level_editor_window = imguigml_begin("Level Editor",level_editor);
		//set debug to the boolean value of open on the window
		level_editor = level_editor_window[1];
		
		//set window scale and display mode
		imguigml_set_display_mode(EImGui_DisplayMode.GUIAspect)
		imguigml_set_display_scale(scale,scale);
		
		//while the window is uncollapsed and open
		if(level_editor_window[0] and level_editor_window[1])
		{
				
		}		
		//end the panel input
		imguigml_end();
	}
	
}

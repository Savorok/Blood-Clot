/// @description get menu ready and draw it

#region get variables

//get once every 4 frames (or so)
var i = choose(1,0,0,0)
if(i == 1){real_game_fps = string(fps_real);}

#endregion

if(imguigml_ready())
{
	if(debug)
	{
		//activate the initial window 
		imguigml_set_next_window_size(menu_width, menu_height, EImGui_Cond.Once);
		var dev_window = imguigml_begin("Dev Window",debug);
		//set debug to the boolean value of open on the window
		debug = dev_window[1];
		
		//set window scale and display mode
		imguigml_set_display_mode(EImGui_DisplayMode.GUIAspect)
		imguigml_set_display_scale(scale,scale);
		
		//while the window is uncollapsed and open
		if(dev_window[0] and dev_window[1])
		{
			#region performance metrics and debug masks
			
			imguigml_text("Fps:" + string(fps) + " |"); 
			imguigml_push_item_width(32);
			imguigml_pop_item_width();  
			imguigml_same_line(); 
			
			imguigml_text("Real Fps:" + real_game_fps + " |");
			imguigml_push_item_width(32);
			imguigml_pop_item_width();  
			imguigml_same_line(); 
			
			imguigml_text("Instance Count:" + string(instance_count) + " |");
			imguigml_push_item_width(32);
			imguigml_pop_item_width();  
			imguigml_same_line(); 
			
			imguigml_text("Show Debug Masks:");
			imguigml_push_item_width(32);
			imguigml_pop_item_width();
			imguigml_same_line(); 
			var ckbox_show_debug_masks = imguigml_checkbox("", imguigml_mem("checkbox_test",false));
			if(ckbox_show_debug_masks[0])
			{			
				imguigml_memset("checkbox_test", ckbox_show_debug_masks[1]);	
				if(show_debug_masks){show_debug_masks = false;}
				else if(!show_debug_masks){show_debug_masks = true;}
			}
			
			#endregion
		
			imguigml_separator();
					
			//player button
			if(imguigml_button("Player") and !instance_exists(imgui_player))
			{
				instance_create_depth(0,0,depth,imgui_player);		
				if(close_on_open){debug = 0;}
			}
			imguigml_same_line();
			//cameras button
			if(imguigml_button("Camera") and !instance_exists(imgui_cameras))
			{
				instance_create_depth(0,0,depth,imgui_cameras);
				if(close_on_open){debug = 0;}
			}
			imguigml_same_line();
			if(imguigml_button("Spawn") and !instance_exists(imgui_spawn))
			{
				instance_create_depth(0,0,depth,imgui_spawn);
				if(close_on_open){debug = 0;}
			}
			imguigml_same_line();
			//close on open check
			imguigml_text("Close on open:");
			imguigml_same_line();
			var chk_close_on_open = imguigml_checkbox("##close_on_open", close_on_open)
			if(chk_close_on_open[0])
			{
				close_on_open = chk_close_on_open[1];
			}
			
			
		}		
		//end the panel input
		imguigml_end();
	}
	
}
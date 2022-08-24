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
			#region performance metrics and debug masks version
			
			imguigml_text("Ver: " + string(Global_Controller.version) + "|");
			imguigml_same_line();
			
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
			var ckbox_show_debug_masks = imguigml_checkbox("", show_debug_masks);
			if(ckbox_show_debug_masks[0])
			{			
				show_debug_masks = ckbox_show_debug_masks[1];	
			}
				
			
			#endregion
		
			imguigml_separator();
					
			//player button
			if(imguigml_button("Player") and !instance_exists(imgui_player))
			{
				instance_create_layer(0,0,"Controllers",imgui_player);		
				if(close_on_open){debug = 0;}
			}
			imguigml_same_line();
			//cameras button
			if(imguigml_button("Camera") and !instance_exists(imgui_cameras))
			{
				instance_create_layer(0,0,"Controllers",imgui_cameras);
				if(close_on_open){debug = 0;}
			}
			imguigml_same_line();
			if(imguigml_button("Spawn") and !instance_exists(imgui_spawn))
			{
				instance_create_layer(0,0,"Controllers",imgui_spawn);
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
			
			imguigml_separator();
			
			//main screen bar
			imguigml_begin_main_menu_bar()
			{
				if(imguigml_button("Exit Game"))
				{
					game_end();
				}		
				imguigml_end_main_menu_bar();
			}
			
			
		}		
		//end the panel input
		imguigml_end();
	}
	
}

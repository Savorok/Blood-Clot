/// @description get menu ready and draw it

#region get variables

//get once every 4 frames (or so)
var i = choose(1,0,0,0)
if(i == 1){real_game_fps = string(fps_real);}

#endregion

if(imguigml_ready())
{
	//var size = [0,0];
	//var pos = [0,0];
	if(debug)
	{
		//activate the initial window 
		imguigml_set_next_window_size(640, 480, EImGui_Cond.Once);
		var dev_window = imguigml_begin("Dev Window",debug);
		//set debug to the boolean value of open on the window
		debug = dev_window[1];
		
		//set window scale and display mode
		imguigml_set_display_mode(EImGui_DisplayMode.GUIAspect)
		imguigml_set_display_scale(2,2);
		
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
			}
		}		
		//end the panel input
		imguigml_end();
	}
	
}

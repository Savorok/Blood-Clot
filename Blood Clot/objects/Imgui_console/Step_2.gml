/// @description 

#region close if needed

if(!instance_exists(imgui)){exit;}
if(!imguigml_ready()){exit;}

#endregion

if(debug)
{

	//activate the initial window 
	imguigml_set_next_window_size(menu_width, menu_height, EImGui_Cond.Once);
	var console_window = imguigml_begin("Console",true);
	
	//set window scale and display mode
	imguigml_set_display_mode(EImGui_DisplayMode.GUIAspect)
	imguigml_set_display_scale(scale,scale);

	if(console_window[0])
	{
		#region console
			
		//filter
		imguigml_text("Filter:");
		HelpHover("just type a word or phrase to filter by it,\n put '-' infront for exclusive filter");
		imguigml_same_line();
		var filter = imguigml_input_text("##filter_string",filter_string,255);
		if(filter[0])
		{
			filter_string = filter[1];	
		}
			
		//a button to clear the console
		var clear = imguigml_button("Clear");
		if(clear)
		{
			stack = [];
			stack_prefix = [];
		}
			
		imguigml_separator();
						
		//draw the console stack
		for(i = 0; i < array_length(stack); i++)
		{
			var skip = false;
			var output_string = stack_prefix[i] + stack[i];
			
			//exclusive check
			if(string_pos("-",filter_string) == 1)
			{			
				var check_string = string_delete(filter_string,1,1);
				var str_pos = string_pos(check_string, output_string);
				
				if(str_pos > 0){ skip = true; }
				else if(str_pos == 0){ skip = false; }
			}
			//inclusive check
			else if(filter_string != "")
			{	
				var str_pos = string_pos(filter_string, output_string);
				
				if(str_pos > 0){ skip = false; } 
				else if(str_pos == 0){ skip = true; }		
			}
				
			if(!skip)
			{
				//colour if needed
				if(stack_prefix[i] == "[err]")
				{
					imguigml_push_id(1);
					imguigml_push_style_color(EImGui_Col.Text,imguigml_color_convert_gml_to_u32(c_red));
					imguigml_text(stack_prefix[i] + stack[i]);	
					imguigml_pop_style_color(1);
					imguigml_pop_id();
				}
				else if(stack_prefix[i] == "[log]")
				{
					imguigml_push_id(1);
					imguigml_push_style_color(EImGui_Col.Text,imguigml_color_convert_gml_to_u32(c_lime));
					imguigml_text(stack_prefix[i] + stack[i]);	
					imguigml_pop_style_color(1);
					imguigml_pop_id();
				}
				else
				{
					imguigml_text(stack_prefix[i] + stack[i]);		
				}
			}
		}
					
		#endregion	
	
		//close window if needed
		if(!console_window[1])
		{
			instance_destroy();	
		}
	}

	imguigml_end();
}
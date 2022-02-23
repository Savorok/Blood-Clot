/// @description draw camera dev menu

#region close if needed

if(!instance_exists(imgui)){exit;}
if(!imguigml_ready()){exit;}

#endregion

#region get camera variables

var camera_properties = [spr_none_64];
if(instance_exists(obj_player))
{
	camera_properties[0] = obj_player_camera.follow.sprite_index;
	camera_properties[1] = Camera_Controller.shaking;
}

#endregion

//activate the initial window 
imguigml_set_next_window_size(menu_width, menu_height, EImGui_Cond.Once);
var camera_window = imguigml_begin("Camera Window",true);
	
//set window scale and display mode
imguigml_set_display_mode(EImGui_DisplayMode.GUIAspect)
imguigml_set_display_scale(scale,scale);

if(camera_window[0])
{
	
	#region resoloution
	
	//resoloution colapser 
	var resoloution_tab = imguigml_collapsing_header("Resoloution")
	if(resoloution_tab[0])
	{
		//aspect ratio
		imguigml_text("Aspect Ratio:");
		imguigml_same_line();
		var comb_aspect_ratio = imguigml_combo("##aspect_ratio",cur_aspect_ratio,aspect_ratios);
		if(comb_aspect_ratio[0])
		{
			cur_aspect_ratio = comb_aspect_ratio[1];		
			imguigml_end_combo();
		}
	
		//window size
		imguigml_text("Window Size:");
		imguigml_same_line();
		var comb_window_size = imguigml_combo("##window_size",cur_resoloution,resoloutions[cur_aspect_ratio]);
		if(comb_window_size[0])
		{
			cur_resoloution = comb_window_size[1];	
			imguigml_end_combo();
		}
	
		//fullscreen
		imguigml_text("Fullscreen:");
		imguigml_same_line();
		var chk_fullscreen = imguigml_checkbox("##fullscreen", fullscreen)
		if(chk_fullscreen[0])
		{
			fullscreen = chk_fullscreen[1];
		}
		
		imguigml_same_line();
		var apply = imguigml_button("apply");
		if(apply)
		{	
			scr_resoloution(cur_aspect_ratio, cur_resoloution, obj_player_camera, fullscreen);
			win_w = Camera_Controller.window_width;
			win_h = Camera_Controller.window_height;
			view_w = Camera_Controller.view_width;
			view_h = Camera_Controller.view_height;
		}
	}
	
	//custom resolouiton 
	var custom_resoloution_tab = imguigml_collapsing_header("Custom Resoloution")
	if(custom_resoloution_tab[0])
	{	
		//window size
		imguigml_text("Window Width:");
		imguigml_same_line();
		var input_win_w = imguigml_input_int("##win_w",win_w,1,100);
		if(input_win_w[0])
		{
			win_w = input_win_w[1];
		}
		imguigml_text("Window Height:");
		imguigml_same_line();
		var input_win_h = imguigml_input_int("##win_h",win_h,1,100);
		if(input_win_h[0])
		{
			win_h = input_win_h[1];
		}
		
		imguigml_separator();
		 
		//fullscreen
		imguigml_text("Fullscreen:");
		imguigml_same_line();
		var chk_fullscreen = imguigml_checkbox("##fullscreen", fullscreen)
		if(chk_fullscreen[0])
		{
			fullscreen = chk_fullscreen[1];
			
		}
		
		imguigml_same_line();
		var apply_2 = imguigml_button("apply");
		if(apply_2)
		{	
			scr_resoloution_custom(obj_player_camera,win_w,win_h,fullscreen);
			win_w = Camera_Controller.window_width;
			win_h = Camera_Controller.window_height;
		}
		
	}
	
	#endregion
	
	#region cameras
	
	imguigml_begin_tab_bar("Cameras")
	{
		var player_camera_tab = imguigml_begin_tab_item("obj_player_camera")
		if(player_camera_tab[0])
		{
			imguigml_columns(2);
	
			//draw currently following	
			imguigml_set_column_width(0, 80);
			imguigml_text("Following:");
			imguigml_sprite(camera_properties[0],0,64,64);
			imguigml_next_column()
			
			#region view size

			imguigml_text("View Width:");
			imguigml_same_line();
			var input_view_w = imguigml_input_int("##view_w",view_w);
			if(input_view_w[0])
			{
				view_w = input_view_w[1];
			}
			imguigml_text("View Height:");
			imguigml_same_line();
			var input_view_h = imguigml_input_int("##view_h",view_h);
			if(input_view_h[0])
			{
				view_h = input_view_h[1];
			}
			var apply_3 = imguigml_button("apply");
			if(apply_3)
			{	
				scr_view_custom(obj_player_camera,view_w,view_h);
			}
				
			#endregion
				
			imguigml_next_column();
			imguigml_separator();
			imguigml_columns(1);
			
			#region movement
			
			imguigml_text("Pan speed:");
			imguigml_same_line();
			HelpHover("Higher is slower");
			imguigml_same_line();
			var pan_speed_input = imguigml_input_int("##pan_speed",pan_speed,1,5);
			if(pan_speed_input[0])
			{
				obj_player_camera.pan_speed = pan_speed_input[1];
				pan_speed = pan_speed_input[1];
			}
			
			#endregion
		
			imguigml_separator();
		
			#region shaking
			
			imguigml_text("shake amount:");
			imguigml_same_line();
			var shake_amount_input = imguigml_input_int("##shake_amount",shake_amount,1,5);
			if(shake_amount_input[0])
			{
				obj_player_camera.shake_amount = shake_amount_input[1];
				shake_amount = shake_amount_input[1];
			}
			imguigml_text("Shaking:");
			imguigml_same_line();
			var chk_shaking = imguigml_checkbox("##shake",camera_properties[1])
			if(chk_shaking[0])
			{
				Camera_Controller.shaking = chk_shaking[1]
			}
			
			
			#endregion
			
			imguigml_separator();
			
			#region zooming
			
			//zoom amount
			imguigml_text("")
			
			//zoom per tick
			imguigml_text("Zoom_w");
			imguigml_same_line();
			HelpHover("The amount of width to zoom\nper tick");
			imguigml_same_line();
			var input_zoom_width = imguigml_input_float("##zoom_width",zoom_w,0,1000,1);
			if(input_zoom_width[0])
			{
				obj_player_camera.zoom_w = input_zoom_width[1];
				zoom_w = input_zoom_width[1];
			}
			imguigml_text("Zoom_h");
			imguigml_same_line();
			HelpHover("The amount of height to zoom\nper tick");
			imguigml_same_line();
			var input_zoom_height = imguigml_input_float("##zoom_height",zoom_h,0,1000,1);
			if(input_zoom_height[0])
			{
				obj_player_camera.zoom_h = input_zoom_height[1];
				zoom_h = input_zoom_height[1];
			}
			
			//max zoom
			imguigml_text("max_zoom_w");
			imguigml_same_line();
			HelpHover("The width of the view when fully zoomed");
			imguigml_same_line();
			var input_max_zoom_width = imguigml_input_float("##max_zoom_width",max_zoom_width,0,1000,1);
			if(input_max_zoom_width[0])
			{
				obj_player_camera.max_zoom_width = input_max_zoom_width[1];
				max_zoom_width = input_max_zoom_width[1];
			}
			imguigml_text("max_zoom_h");
			imguigml_same_line();
			HelpHover("The amount of height to zoom\nper tick");
			imguigml_same_line();
			var input_max_zoom_height = imguigml_input_float("##max_zoom_height",max_zoom_height,0,1000,1);
			if(input_max_zoom_height[0])
			{
				obj_player_camera.max_zoom_height = input_max_zoom_height[1];
				max_zoom_height = input_max_zoom_height[1];
			}
			
			//return time
			imguigml_text("return_time");
			imguigml_same_line();
			HelpHover("The amount to return from zoom per tick");
			imguigml_same_line();
			var input_return_time = imguigml_input_float("##return_time",return_time,0,1000,1);
			if(input_return_time[0])
			{
				obj_player_camera.return_time = input_return_time[1];
				return_time = input_return_time[1];
			}
			
			#endregion
			
			imguigml_end_tab_item();
		}
		var other_camera_tab = imguigml_begin_tab_item("Another Camera")
		if(other_camera_tab[0])
		{
			imguigml_text("Other Camera Stuff");
			imguigml_end_tab_item();
		}		
		imguigml_end_tab_bar();
	}
	
	#endregion
		
	//close window if needed
	if(!camera_window[1])
	{
		instance_destroy();	
	}
}

imguigml_end();
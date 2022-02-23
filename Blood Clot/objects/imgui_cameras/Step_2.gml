/// @description 

#region close if needed

if(!instance_exists(imgui)){exit;}
if(!imguigml_ready()){exit;}

#endregion

#region get camera variables

var camera_properties = [spr_none_64];
if(instance_exists(obj_player))
{
	camera_properties[0] = obj_player_camera.follow.sprite_index;
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
		
		//view size
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
			scr_resoloution_custom(obj_player_camera,win_w,win_h,view_w,view_h,fullscreen);
			win_w = Camera_Controller.window_width;
			win_h = Camera_Controller.window_height;
			view_w = Camera_Controller.view_width;
			view_h = Camera_Controller.view_height;
		}
		
	}
	
	
	
	
	
	
	
	
	//draw currently following	
	imguigml_text("Following:");
	imguigml_sprite(camera_properties[0],0,64,64);
	
	//close window if needed
	if(!camera_window[1])
	{
		instance_destroy();	
	}
}

imguigml_end();
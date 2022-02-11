/// @description 

#region close if needed

if(!instance_exists(imgui)){exit;}
if(!imguigml_ready()){exit;}

#endregion

#region get camera variables

var camera_properties = [spr_none];
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
	//aspect ratio
	imguigml_text("Aspect Ratio:");
	imguigml_same_line();
	var comb_aspect_ratio = imguigml_combo("",cur_aspect_ratio,aspect_ratios);
	if(comb_aspect_ratio[0])
	{
		cur_aspect_ratio = comb_aspect_ratio[1];
	}
	
	//aspect ratio
	imguigml_text("Window Size:");
	imguigml_same_line();
	var comb_window_size = imguigml_combo("",cur_resoloution,resoloutions);
	if(comb_window_size[0])
	{
		cur_resoloution = comb_window_size[1];
	}
	
	
	
	
	//view size
	imguigml_text("View Size");
	imguigml_same_line();
	var res = ["640*360","3840*2160"];
	imguigml_combo("",0,res);
	
	
	
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
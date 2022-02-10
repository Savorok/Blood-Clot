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
	var comb = imguigml_combo("",cur_aspect_ratio,aspect_ratios);
	if(comb[0])
	{
		cur_aspect_ratio = comb[1];
	}

	
	
	
	//resoloution
	var resoloution = ["1920*1080","3840*2160"];
	imguigml_combo("Screen Resoloution:",0,resoloution);
	
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
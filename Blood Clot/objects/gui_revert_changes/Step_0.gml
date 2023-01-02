/// @description revert changes functionality

var right = keyboard_check_released(vk_right) or keyboard_check_released(ord("D"));
var left = keyboard_check_released(vk_left) or keyboard_check_released(ord("A"));
var push = keyboard_check_released(vk_enter) or keyboard_check_released(ord("E")) or (gamepad_button_check_pressed(0,gp_face1)) or mouse_check_button(mb_left) or (gamepad_button_check_pressed(0,gp_start));

#region //move menu

//go right
if(right and mpos == 0)
{
	mpos = 1;	
}
else if(right and mpos == 1)
{
	mpos = 0;	
}

//go left
if(left and mpos == 0)
{
	mpos = 1;	
}
else if(left and mpos == 1)
{
	mpos = 0;	
}

#endregion

#region //menu functionality

//keep changes
if(mpos == 1 and push)
{
	gui_pause_options.active = true;
	gui_pause_options.mpos = 0;
	
	//save new changes to options file
	scr_save_display_pref(Camera_Controller.cur_aspect_ratio, Camera_Controller.cur_resoloution, Camera_Controller.cur_fullscreen);
	
	instance_destroy();
}
//revert changes
if(mpos == 0 and push)
{
	//update aspect ratio
	scr_resoloution(prev_aspect_ratio, prev_resoloution, obj_player_camera, prev_fullscreen);
	//update gui
	display_set_gui_size(Camera_Controller.window_width,Camera_Controller.window_height);
	centre_x = Camera_Controller.window_width/2;
	centre_y = Camera_Controller.window_height/2;
	//set the options back to what they where
	gui_pause_options.cur_aspect_ratio = prev_aspect_ratio;
	gui_pause_options.cur_resoloution = prev_resoloution;
	gui_pause_options.cur_fullscreen = prev_fullscreen;
	gui_pause_options.centre_x = centre_x;
	gui_pause_options.centre_y = centre_y;
	//go back to options
	gui_pause_options.active = true;
	gui_pause_options.mpos = 0;
	instance_destroy();
}

#endregion
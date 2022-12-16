/// @description Insert description here

//check to go back to pause 
var back = keyboard_check_released(vk_escape) or keyboard_check_released(vk_backspace) or (gamepad_button_check_pressed(0,gp_start))

if(back)
{
	instance_destroy();
}

#region //move menu

var up = keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W")) or mouse_wheel_up() or (gamepad_button_check_pressed(0,gp_padu));
var down = keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S")) or mouse_wheel_down() or (gamepad_button_check_pressed(0,gp_padd));

if(mpos == 0 and up)
{
	mpos = 4;
}
else if(mpos != 0 and up)
{
	mpos -=1
}
if(mpos == 0 and down)
{
	mpos +=1;
}
else if(mpos != 0 and down)
{
	mpos += 1
}
if(mpos > 4 and down)
{
	mpos  = 0;
}

#endregion

#region //menu functionality

var right = keyboard_check_released(vk_right);
var left = keyboard_check_released(vk_left);
var push = keyboard_check_released(vk_enter) or keyboard_check_released(ord("E")) or (gamepad_button_check_pressed(0,gp_face1)) or mouse_check_button(mb_left) or (gamepad_button_check_pressed(0,gp_start));

//aspect ratio
if(mpos == 0)
{
	if(right)
	{
		if(cur_aspect_ratio = 2)
		{
			cur_aspect_ratio = 0;
		}
		else
		{
			cur_aspect_ratio++;
		}
	}
	else if(left)
	{
		if(cur_aspect_ratio = 0)
		{
			cur_aspect_ratio = 2;
		}
		else
		{
			cur_aspect_ratio--;
		}
	}
	else if(push)
	{
		//update aspect ratio
		scr_resoloution(cur_aspect_ratio, cur_resoloution, obj_player_camera, cur_fullscreen);
		//update menu
		cur_aspect_ratio = Camera_Controller.cur_aspect_ratio;
		cur_resoloution = Camera_Controller.cur_resoloution;
		//update gui
		display_set_gui_size(Camera_Controller.window_width,Camera_Controller.window_height);
		centre_x = Camera_Controller.window_width/2;
		centre_y = Camera_Controller.window_height/2;
	}
}
//resoloution
if(mpos == 1)
{
	if(right)
	{
		if(cur_resoloution = 2)
		{
			cur_resoloution = 0;
		}
		else
		{
			cur_resoloution++;
		}
	}
	else if(left)
	{
		if(cur_resoloution = 0)
		{
			cur_resoloution = 2;
		}
		else
		{
			cur_resoloution--;
		}
	}
	else if(push)
	{
		//update aspect ratio
		scr_resoloution(cur_aspect_ratio, cur_resoloution, obj_player_camera, cur_fullscreen);
		//update menu
		cur_aspect_ratio = Camera_Controller.cur_aspect_ratio;
		cur_resoloution = Camera_Controller.cur_resoloution;
		//update gui
		display_set_gui_size(Camera_Controller.window_width,Camera_Controller.window_height);
		centre_x = Camera_Controller.window_width/2;
		centre_y = Camera_Controller.window_height/2;
	}
}
//fullscreen
if(mpos == 2)
{
	if(right)
	{
		if(cur_fullscreen = 1)
		{
			cur_fullscreen = 0;
		}
		else
		{
			cur_fullscreen++;
		}
	}
	else if(left)
	{
		if(cur_fullscreen = 0)
		{
			cur_fullscreen = 1;
		}
		else
		{
			cur_fullscreen--;
		}
	}
	else if(push)
	{
		//update aspect ratio
		scr_resoloution(Camera_Controller.cur_aspect_ratio, Camera_Controller.cur_resoloution, obj_player_camera, cur_fullscreen);
		//update menu
		cur_aspect_ratio = Camera_Controller.cur_aspect_ratio;
		cur_resoloution = Camera_Controller.cur_resoloution;
		cur_fullscreen = Camera_Controller.cur_fullscreen;
		//update gui
		display_set_gui_size(Camera_Controller.window_width,Camera_Controller.window_height);
		centre_x = Camera_Controller.window_width/2;
		centre_y = Camera_Controller.window_height/2;
	}
}
//apply
if(mpos == 4 and push)
{
	//update aspect ratio
	scr_resoloution(cur_aspect_ratio, cur_resoloution, obj_player_camera, cur_fullscreen);
	//update menu
	cur_aspect_ratio = Camera_Controller.cur_aspect_ratio;
	cur_resoloution = Camera_Controller.cur_resoloution;
	cur_fullscreen = Camera_Controller.cur_fullscreen;
	//update gui
	display_set_gui_size(Camera_Controller.window_width,Camera_Controller.window_height);
	centre_x = Camera_Controller.window_width/2;
	centre_y = Camera_Controller.window_height/2;
}



#endregion
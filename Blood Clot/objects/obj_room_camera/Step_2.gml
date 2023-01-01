#region camera variables 

var cur_camera_width = view_width;
var cur_camera_height = view_height;

//are these doing anything???
var new_camera_width = cur_camera_width;
var new_camera_height = cur_camera_height;

#endregion

#region camera code 

if(mouse_wheel_up())
{
	view_width -= cur_camera_width/zoom_speed
	view_height-= cur_camera_height/zoom_speed
	
	camera_set_view_pos(view_camera[0],x,y);
	camera_set_view_size(view_camera[0],view_width, view_height);	
	
	alarm[0] = 1;
}
if(mouse_wheel_down())
{
	view_width += cur_camera_width/zoom_speed
	view_height += cur_camera_height/zoom_speed
	
	camera_set_view_pos(view_camera[0],x,y);
	camera_set_view_size(view_camera[0],view_width, view_height);	
	
	alarm[0] = 1;
}


//set camera position and size
camera_set_view_pos(view_camera[0],x,y);
camera_set_view_size(view_camera[0],view_width, view_height);


#endregion

#region movement code

key_left = keyboard_check(ord("A")) or (gamepad_button_check(0,gp_padl)) or (gamepad_axis_value(0,gp_axislh)  < 0);
key_right = keyboard_check(ord("D")) or (gamepad_button_check(0,gp_padr)) or (gamepad_axis_value(0,gp_axislh) > 0);
key_up = keyboard_check(ord("W"))
key_down = keyboard_check(ord("S"))

if(key_left){ x -= 10;}
if(key_right){ x += 10;}
if(key_up){ y -= 10;}
if(key_down){ y += 10;}

#endregion
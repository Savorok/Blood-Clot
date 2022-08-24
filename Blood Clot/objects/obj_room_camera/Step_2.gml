#region camera variables 

var cur_camera_width = camera_get_view_width(view_camera[0]);
var cur_camera_height = camera_get_view_height(view_camera[0]);
var new_camera_width = cur_camera_width;
var new_camera_height = cur_camera_height;

#endregion

#region camera code 






//set camera position and size
camera_set_view_pos(view_camera[0],x,y);
camera_set_view_size(view_camera[0],new_camera_width, new_camera_height);

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
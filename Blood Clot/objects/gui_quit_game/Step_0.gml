/// @description move menu

//keyboard inputs for navigation
right = keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D")) or mouse_wheel_up() or (gamepad_button_check_pressed(0,gp_padr));
left = keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A")) or mouse_wheel_down() or (gamepad_button_check_pressed(0,gp_padl));

//change position 
if(mpos == 0 and (right || left))
{
	mpos = 1;	
}
else if(mpos == 1 and (right || left))
{
	mpos = 0;	
}

//do menu function
var push = keyboard_check_released(vk_enter) or keyboard_check_released(ord("E")) or (gamepad_button_check_pressed(0,gp_face1)) or mouse_check_button_pressed(mb_left) or (gamepad_button_check_pressed(0,gp_start));

//go back
if(mpos == 0 and push)
{
	instance_create_layer(x,y,"Controllers",gui_pause_menu);
	instance_destroy();
}
//quit game
if(mpos == 1 and push)
{
	game_end();
}

//close dialog with esc
if(keyboard_check_pressed(vk_escape))
{
	Level_Controller.pause_blocked = false;
	instance_create_layer(x,y,"Controllers",gui_pause_menu);
	instance_destroy();	
}
/// @description Move menu

//keyboard inputs for navigation
up = keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W")) or mouse_wheel_up() or (gamepad_button_check_pressed(0,gp_padu));
down = keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S")) or mouse_wheel_down() or (gamepad_button_check_pressed(0,gp_padd));

//change menu postion
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

//do menu function
var push = keyboard_check_released(vk_enter) or keyboard_check_released(ord("E")) or (gamepad_button_check_pressed(0,gp_face1)) or mouse_check_button_pressed(mb_left) or (gamepad_button_check_pressed(0,gp_start));

//continue
if(mpos == 0 and push)
{
	Level_Controller.paused = false;
}
//restart
if(mpos == 1 and push)
{
	room_restart();
	Camera_Controller.alarm[2] = 1;
}
//options
if(mpos == 2 and push)
{
	instance_create_layer(x,y,"Controllers",gui_pause_options)
	instance_destroy();
}
//main menu
if(mpos == 3 and push)
{
	show_debug_message("Should be here");
	room_goto(rm_main_menu);
}
//exit game
if(mpos == 4 and push)
{
	instance_create_layer(x,y,"Controllers",gui_quit_game);
	instance_destroy();
}

if(keyboard_check_pressed(vk_escape))
{
	//Level_Controller.paused = false; 
	//Level_Controller.can_respawn = true;
}

/// @description Move menu

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

//do menu function
var push = keyboard_check_released(vk_enter) or keyboard_check_released(ord("E")) or (gamepad_button_check_pressed(0,gp_face1)) or mouse_check_button(mb_left) or (gamepad_button_check_pressed(0,gp_start));

//continue
if(mpos == 0 and push)
{
	Level_Controller.paused = false;
}
//restart
if(mpos == 1 and push)
{
	room_restart();
}
//options
if(mpos == 2 and push)
{
	
}
//main menu
if(mpos == 3 and push)
{

}
//exit game
if(mpos == 4 and push)
{
	game_end();
}
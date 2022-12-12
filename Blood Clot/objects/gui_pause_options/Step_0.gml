/// @description Insert description here

//check to go back to pause 
var back = keyboard_check_released(vk_escape) or keyboard_check_released(vk_backspace) or (gamepad_button_check_pressed(0,gp_start))

if(back)
{
	instance_destroy();
}

//move menu
var up = keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W")) or mouse_wheel_up() or (gamepad_button_check_pressed(0,gp_padu));
var down = keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S")) or mouse_wheel_down() or (gamepad_button_check_pressed(0,gp_padd));

if(mpos == 0 and up)
{
	mpos = 3;
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
if(mpos > 3 and down)
{
	mpos  = 0;
}
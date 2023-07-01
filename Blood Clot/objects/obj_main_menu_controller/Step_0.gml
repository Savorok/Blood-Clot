/// @description keyboard controll for menu

//init keyboard controlls
var up = keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W")) or mouse_wheel_up() or (gamepad_button_check_pressed(0,gp_padu));
var down = keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S")) or mouse_wheel_down() or (gamepad_button_check_pressed(0,gp_padd));
var push = keyboard_check_released(vk_enter) or keyboard_check_released(ord("E")) or (gamepad_button_check_pressed(0,gp_face1)) or mouse_check_button(mb_left) or (gamepad_button_check_pressed(0,gp_start));

#region //switch between input modes

//player is using keyboard input
if(menu_mode == 0 and (up || down))
{
	menu_mode = 1;
	mx = mouse_x;
	my = mouse_y;
	mpos = -1;
}

if(mpos < 0)
{
	mpos = 7;	
}
//player is going from keyboard to mouse mode
if(menu_mode == 1)
{
	//player is using mouse input 
	var moving = point_distance(mx,my,mouse_x,mouse_y);
	
	if(moving)
	{
		menu_mode = 0;	
		mpos = 0;
	}
	
	//set all buttons to have no hoverover
	for(i = 0; i < array_length(menu_buttons); i++)
	{
		menu_buttons[i].image_index = 0;		
	}
}

#endregion

#region //move menu with keyboard

if(mpos == 0 and up)
{
	mpos = 6;
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
if(mpos > 6 and down)
{
	mpos  = 0;
}

#endregion

#region //interact with menu
if(menu_mode == 1)
{
	//new game
	if(mpos == 0 and push)
	{
	
	}
	//continue
	if(mpos == 1 and push)
	{
		Camera_Controller.alarm[2] = 1;
		room_goto(Room1);
	}
	//level select
	if(mpos == 2 and push)
	{
	
	}
	//level editor
	if(mpos == 3 and push)
	{

	}
	//bonus
	if(mpos == 4 and push)
	{
	
	}
	//settings
	if(mpos == 5 and push)
	{
	
	}
	//guit
	if(mpos == 6 and push)
	{
		game_end();
	}
}
#endregion

#region //highlight relevent button if needed

if(menu_mode == 1)
{
	for(i = 0; i < array_length(menu_buttons); i++)
	{
		if(i = mpos)
		{
			menu_buttons[i].image_index = 1;	
		}
		else
		{
			menu_buttons[i].image_index = 0;	
		}
	}
}

#endregion

//pause functionality
key_pause = keyboard_check_pressed(vk_escape) or gamepad_button_check_pressed(0,gp_start);

if(key_pause and !paused and !level_complete and !pause_blocked)
{ 
	paused = true; 
	can_respawn = false;
	instance_create_layer(x,y,"Controllers",gui_pause_menu);
}

//timer
if(!paused and !level_complete)
{
	//increase seconds
	if(count_up)
	{
		seconds += 1/room_speed;
	}
	//add minutes at 60 sec
	if(seconds < 60 and seconds > 59.9)
	{
		seconds = 0;
		minutes += 1;
	}
}

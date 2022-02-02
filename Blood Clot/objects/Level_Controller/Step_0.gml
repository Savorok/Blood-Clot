
//pause functionality
key_pause = keyboard_check_pressed(vk_escape);

if(key_pause and !paused)
{ 
	paused = true; 
	can_respawn = false;
}
else if(key_pause and paused)
{ 
	paused = false; 
	can_respawn = true;
}

//check goto next level
if(level_complete == true)
{
	level_complete = false;
	alarm[1] = 120;
}

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

//debug functionality
key_debug = keyboard_check_pressed(vk_f1);

if(key_debug and !debug){ debug = true; }
else if(key_debug and debug){ debug = false; }

//check goto next level
if(level_complete == true)
{
	level_complete = false;
	alarm[1] = 120;
}
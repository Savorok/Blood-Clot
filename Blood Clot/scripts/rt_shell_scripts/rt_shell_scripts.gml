/// desc The following a list of shell scripts for use in the console

function sh_test(args)
{
	return "You Wrote: " + args[1] + ".";	
}

// go to specified room
function sh_goto(args)
{
	_room_name = args[1];
	
	try
	{
		_room = asset_get_index(_room_name);
		room_goto(_room);
	}
	catch(_exception)
	{
		return "The specified room '" + _room_name + "' Does not exist."
	}	
}

//set fullscreen
function sh_fullscreen(args)
{
	_cur_aspect_ratio = Camera_Controller.cur_aspect_ratio;
	_cur_resoloution = Camera_Controller.cur_resoloution;
	_cur_camera = Camera_Controller.cur_active_camera;
	_cur_fullscreen = Camera_Controller.cur_fullscreen;
	
	if(args[1] == "true" or args[1] == "t")
	{
		_cur_fullscreen = true;
	}
	else if(args[1] == "false" or args[1] == "f")
	{
		_cur_fullscreen = false;
	}
	else
	{
		return "Invalid argument!"	
	}
	
	scr_resoloution(_cur_aspect_ratio,_cur_resoloution,_cur_camera,_cur_fullscreen);
}

function sh_quit(args)
{
	game_end();	
}
	
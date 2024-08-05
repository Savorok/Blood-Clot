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

function sh_quit(args)
{
	game_end();	
}
	
#region resolution

function sh_set_resolution(args)
{
	var _window_width = args[1];
	var _window_height = args[2];
	
	scr_set_resolution(_window_width,_window_height);
}

function sh_set_aspect_ratio(args)
{
	var _aspect_ratio = args[1];
	scr_set_aspect_ratio(_aspect_ratio);
}

function sh_fullscreen(args)
{
	//toggle fullscreen if no argument is given
	if(array_length(args) == 1)
	{
		var _value = !Camera_Controller.cur_fullscreen
		scr_set_fullscreen(!Camera_Controller.cur_fullscreen);
	}
	else
	{
		var _value = args[1];
		scr_set_fullscreen(_value);	
	}
}

#endregion

#region build mode

function sh_build_mode(args)
{
	var _build_state = args[1];
	
	try
	{
		switch(_build_state)
		{
			case true:
				if(!instance_exists(LevelEditor_Controller))
				{
					instance_create_depth(x,y,-1000,LevelEditor_Controller);	
				}
				else
				{
					return "Already in build mode";	
				}
				
				break;
				
			case false:
				if(instance_exists(LevelEditor_Controller))
				{
					instance_destroy(LevelEditor_Controller);
				}
				else
				{
					return "Build mode not active";	
				}
			
				break;
		}
	}
	catch(_exception)
	{
		return "Not a valid state of build mode";	
	}
	
}

#endregion
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
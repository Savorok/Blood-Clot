/// The metadata functions for the shell scripts

//meata data for sh_goto
function meta_goto()
{
	return
	{
		description: "Go to a specified room.",
		arguments: ["room_name"],
		suggestions: [
			//get all the room names 
			function()
			{
				var _names = [];
				for(var i = 0; i < room_last; i++)
				{
					_names[i] = room_get_name(i)	
				}
				return _names;
			}
		],
		argumentDescriptions: ["The name of the room to go to"],
		hidden: false,
		deferred: false
	}
}
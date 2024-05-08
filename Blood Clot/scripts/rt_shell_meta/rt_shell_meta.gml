/// The metadata functions for the shell scripts

//meata data for sh_goto
function meta_goto()
{
	return
	{
		description: "Go to a specified room.",
		arguments: ["<room_name>"],
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

#region resolution 

function meta_fullscreen()
{
	return
	{
		description: "Change the fullscreen state of the window. If no arguments are given toggle the current state of fullscreen.",
		arguments: ["<state>"],
		suggestions: [["true","false"]],
		argumentDescriptions: ["The state to set the windows fullscreen."],
		hidden: false,
		deferred: false
	}
}

function meta_set_resolution()
{
	return
	{
		description: "Set the windows width and height",
		arguments: ["<width>","<height>"],
		suggestions: [["1920"],["1080"]],
		argumentDescriptions: ["Width of the window.","Height of the window"],
		hidden: false,
		deferred: false
	}	
}

function meta_set_aspect_ratio()
{
	return
	{
		description: "Set the aspect ratio of the camera.",
		arguments: ["<aspect ratio>"],
		suggestions: [["4:3","16:9"]],
		argumentDescriptions: ["The aspect ratio to set the camera"],
		hidden: false,
		deferred: false
	}
}

#endregion



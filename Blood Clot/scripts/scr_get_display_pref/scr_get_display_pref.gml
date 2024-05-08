//read the options file and get the display prefrences
function scr_get_display_pref()
{
	//an array of display prefrences
	//0:Aspect Ratio
	//1:Window Width
	//2:Window Height
	//3:Fullscreen
	//4:GuiScale
	
	var _prefs = [];
	
	//read in the file
	var _options = scr_file_to_array("options.txt");
	
	//get the prefrences
	for(i = 0; i <  array_length(_options); i++)
	{
		//update aspect ratio
		if(string_pos("AspectRatio=",_options[i]) != 0)
		{
			var _aspectRatio = string_split(_options[i],"=");			
			_prefs[0] = _aspectRatio[1]
		}
		
		//Window Width and Height
		if(string_pos("Resoloution=",_options[i]) != 0)
		{	
			var _resoloutions = string_split(_options[i],"=");	
			var _resoloution = string_split(_resoloutions[1],"x");
			
			_prefs[1] = real(_resoloution[0]);
			_prefs[2] = real(_resoloution[1]);
		}
			
		//get fullscreen
		if(string_pos("Fullscreen=",_options[i]) != 0)
		{
			_prefs[3] = real(string_split(_options[i],"=")[1]);
		}
		
		//get gui scale
		if(string_pos("GuiScale=",_options[i]) != 0)
		{
			_prefs[4] = real(string_split(_options[i],"=")[1]);	
		}
	}
	
	//return the prefrences
	return _prefs;
}
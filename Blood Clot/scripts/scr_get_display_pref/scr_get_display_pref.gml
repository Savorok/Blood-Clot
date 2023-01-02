//read the options file and get the display prefrences
function scr_get_display_pref()
{
	//an array of display prefrences
	//0:Aspect Ratio
	//1:Resoloution
	//2:Fullscreen
	//
	prefs = [];
	
	//read in the file
	options = scr_file_to_array("options.txt");
	
	//get the prefrences
	for(i = 0; i <  array_length(options); i++)
	{
		//update aspect ratio
		if(string_pos("AspectRatio=",options[i]) != 0)
		{
			prefs[0] = real(string_split(options[i],"=")[1]);
		}
		
		//update resoloution
		if(string_pos("Resoloution=",options[i]) != 0)
		{	
			prefs[1] = real(string_split(options[i],"=")[1]);
		}
		
		//update fullscreen
		if(string_pos("Fullscreen=",options[i]) != 0)
		{
			prefs[2] = real(string_split(options[i],"=")[1]);
		}
	}
	
	//return the prefrences
	return prefs;
}
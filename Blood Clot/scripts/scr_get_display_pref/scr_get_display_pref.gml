//read the options file and get the display prefrences
function scr_get_display_pref()
{
	//an array of display prefrences
	//0:Aspect Ratio
	//1:Window Width
	//2:Window Height
	//3:CurResoloution
	//4:View Width
	//5:View Height
	//6:Fullscreen
	//7:GuiScale
	
	prefs = [];
	
	//read in the file
	options = scr_file_to_array("options.txt");
	
	//get the prefrences
	for(i = 0; i <  array_length(options); i++)
	{
		//update aspect ratio
		if(string_pos("AspectRatio=",options[i]) != 0)
		{
			var aspectRatio = string_split(options[i],"=");			
			prefs[0] = real(aspectRatio[1])
		}
		
		//Window Width and Height
		if(string_pos("Resoloution=",options[i]) != 0)
		{	
			var resoloutions = string_split(options[i],"=");	
			var resoloution = string_split(resoloutions[1],"x");
			
			prefs[1] = real(resoloution[0]);
			prefs[2] = real(resoloution[1]);
		}
		
		//Current resoloution
		if(string_pos("CurRes=",options[i]) != 0)
		{	
			prefs[3] = real(string_split(options[i],"=")[1]);		
		}
		
		
		//View Width and Height
		if(string_pos("ViewSize=",options[i]) != 0)
		{	
			var viewSizes = string_split(options[i],"=")[1];
			var viewSize = string_split(viewSizes,"x");
			
			prefs[4] = real(viewSize[0]);
			prefs[5] = real(viewSize[1]);
		}		
		//get fullscreen
		if(string_pos("Fullscreen=",options[i]) != 0)
		{
			prefs[6] = real(string_split(options[i],"=")[1]);
		}
		//get gui scale
		if(string_pos("GuiScale=",options[i]) != 0)
		{
			prefs[7] = real(string_split(options[i],"=")[1]);	
		}
	}
	
	//return the prefrences
	return prefs;
}
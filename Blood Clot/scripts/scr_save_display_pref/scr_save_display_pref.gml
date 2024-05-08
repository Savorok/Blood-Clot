// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_save_display_pref(aspectRatio, windowWidth, windowHeight, curResoloution, viewWidth, viewHeight, fullscreen, guiScale)
{
	var _filename = "options.txt"
	
	//print the original file to console
	scr_file_to_console(_filename);
	
	//get the whole file as an array
	var _options = scr_file_to_array(_filename);
	
	//update the display prefrences
	for(i = 0; i <  array_length(_options); i++)
	{
		//update aspect ratio
		if(string_pos("AspectRatio=",_options[i]) != 0)
		{
			_options[i] = "AspectRatio=" + string(aspectRatio);
		}
		
		//update window width and height
		if(string_pos("Resoloution=",_options[i]) != 0)
		{	
			_options[i] = "Resoloution=" + string(windowWidth) + "x" + string(windowHeight);
		}
		
		
		//update resoloution
		if(string_pos("CurRes=",_options[i]) != 0)
		{	
			_options[i] = "CurRes=" + string(curResoloution);
		}
		
		//update view width and height
		if(string_pos("ViewSize=",_options[i]) != 0)
		{	
			_options[i] = "ViewSize=" + string(viewWidth) + "x" + string(viewHeight);
		}
		
		//update fullscreen
		if(string_pos("Fullscreen=",_options[i]) != 0)
		{
			_options[i] = "Fullscreen=" + string(fullscreen);
		}
		
		//update gui scale
		if(string_pos("GuiScale=", _options[i]) != 0)
		{
			_options[i] = "GuiScale=" + string(guiScale);
		}
	}
		
	//re-write the file
	scr_array_to_file(_filename,_options);
	
	//print the new file to console
	scr_file_to_console(_filename);
	
	
	show_debug_message("updated options file")
}
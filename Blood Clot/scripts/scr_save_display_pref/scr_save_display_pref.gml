// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_save_display_pref(aspectRatio, resoloution, fullscreen)
{
	var filename = "options.txt"
	
	//print the original file to console
	scr_file_to_console(filename);
	
	//get the whole file as an array
	options = scr_file_to_array(filename);
	
	//update the display prefrences
	for(i = 0; i <  array_length(options); i++)
	{
		//update aspect ratio
		if(string_pos("AspectRatio=",options[i]) != 0)
		{
			options[i] = "AspectRatio=" + string(aspectRatio);
		}
		
		//update resoloution
		if(string_pos("Resoloution=",options[i]) != 0)
		{	
			options[i] = "Resoloution=" + string(resoloution);
		}
		
		//update fullscreen
		if(string_pos("Fullscreen=",options[i]) != 0)
		{
			options[i] = "Fullscreen=" + string(fullscreen);
		}
	}
		
	//re-write the file
	scr_array_to_file(filename,options);
	
	//print the new file to console
	scr_file_to_console(filename);
	
	
	show_debug_message("updated options file")
}
// given a text file display it in the console
function scr_file_to_console(filename)
{
	//load the data of the file
	var _contents = scr_file_to_array(filename);
	
	//print the contents to console
	show_debug_message("##### " + string(filename) + " #####");
	for(i = 0; i <  array_length(_contents); i++)
	{
		show_debug_message(_contents[i]);
	}
	show_debug_message("#######################");
}
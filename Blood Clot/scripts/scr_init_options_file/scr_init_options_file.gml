// initialise the options file
function scr_init_options_file(filename)
{
	//create options file with given name
	var file = file_text_open_write(filename);

	//the options to put in the file
	var options = [
	"///// Dev Options /////",
	"DevMode=True",
	"///// Display Options /////",
	"AspectRatio=1",
	"Resoloution=1920x1080",
	"CurRes=0",
	"ViewSize=640x360",
	"Fullscreen=0",
	"GuiScale=1"
	]

	//go through all the options and add them to the file
	for(var i = 0; i < array_length(options); i++)
	{
		file_text_write_string(file, options[i]);
		file_text_writeln(file);
	}
	
	//close the file
	file_text_close(file);
	
	show_debug_message("Created options file")
	return true;
}
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_init_options_file(filename)
{
	var f = file_text_open_write(filename);

	file_text_write_string(f, "DevMode=True");
	file_text_writeln(f);
	file_text_write_string(f, "AspectRatio=1");
	file_text_writeln(f);
	file_text_write_string(f, "Resoloution=1");
	file_text_writeln(f);
	file_text_write_string(f, "Fullscreen=0");
	
	file_text_close(f);
	
	show_debug_message("Created options file")
}
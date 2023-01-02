//Copy the entire file to an array so changes can be made
function scr_file_to_array(filename)
{
	//open the file and init the array of lines
	var file = file_text_open_read(filename);
	lines[0] = "";
	
	
	//while there are still lines in the file put them into the array
	var pos = 0;
	while(!file_text_eof(file))
	{
		lines[pos++] = file_text_read_string(file);
		file_text_readln(file);
	}
	
	//close the file and return the contents
	file_text_close(file);
	
	return lines;
}
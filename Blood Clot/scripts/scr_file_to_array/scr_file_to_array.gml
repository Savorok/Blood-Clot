//Copy the entire file to an array so changes can be made
function scr_file_to_array(filename)
{
	//open the file and init the array of lines
	var _file = file_text_open_read(filename);
	lines[0] = "";
	
	
	//while there are still lines in the file put them into the array
	var _pos = 0;
	while(!file_text_eof(_file))
	{
		lines[_pos++] = file_text_read_string(_file);
		file_text_readln(_file);
	}
	
	//close the file and return the contents
	file_text_close(_file);
	
	return lines;
}
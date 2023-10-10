//given an array rewrite a file with its contents 
function scr_2d_array_to_file(filename, newContent)
{
	//open the file to rewrite
	var file = file_text_open_write(filename);
	
	
	//for all of the new contents add it
	for(j = 0; j < array_length(newContent[0]); j++)
	{
		for(i = 0; i < array_length(newContent); i++)
		{
			file_text_write_string(file, newContent[i]);
		}
		file_text_writeln(file);
	}
	
	//close the file
	file_text_close(file);
}
//given an array rewrite a file with its contents 
function scr_ds_grid_to_file(filename, grid)
{
	//open the file to rewrite
	var file = file_text_open_write(filename);
	
	
	//for all of the new contents add it
	for(j = 0; j < ds_grid_height(grid); j++)
	{
		for(i = 0; i < ds_grid_width(grid); i++)
		{
			file_text_write_string(file, ds_grid_get(grid,i,j));
			file_text_write_string(file,",");
		}
		file_text_writeln(file);
	}
	
	//close the file
	file_text_close(file);
}
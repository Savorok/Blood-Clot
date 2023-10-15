///@funciton scr_get_collision_area(level_tilemap)
///@param {index} level_tilemap

///@description This function will take the tilemap of the level and convert it to a ds_grid, 
///				where a filled tile has a value of -1 and an empty space has a value of 0

function scr_get_collision_area(tilemap)
{
	var _width = tilemap_get_width(tilemap);
	var _height = tilemap_get_height(tilemap);

    var _tilemap_grid = ds_grid_create(_width,_height);
	
	for(var j = 0; j<_height; j++)
	{
		for(var i = 0; i<_width; i++)
		{
			var _tile_at_pos = tilemap_get(tilemap,i,j);
			if(_tile_at_pos >= 1){ _tile_at_pos = -1; }
			ds_grid_set(_tilemap_grid,i,j,_tile_at_pos);
		}
	}
	
	
	var file_name = "collisions_array.txt"
	
	//create file to save array
	var file = file_text_open_write(file_name)
	
	//show_debug_message(tilemap_array);
	
	scr_ds_grid_to_file(file_name,_tilemap_grid);
	
	return _tilemap_grid;
	
}
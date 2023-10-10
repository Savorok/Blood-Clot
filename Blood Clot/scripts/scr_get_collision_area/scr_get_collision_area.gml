///@funciton GetCollisionArea(level_tilemap)
///@param {index} level_tilemap

///@description This function will take the tilemap of the level and convert it to an array, 
///				where a filled tile has a value of 1 and an empty space has a value of 0

function scr_get_collision_area(tilemap)
{
	var _width = tilemap_get_width(tilemap);
	var _height = tilemap_get_height(tilemap);

    var tilemap_array = [];
	
	for(var j = 0; j<_height; j++)
	{
		for(var i = 0; i<_width; i++)
		{
			tilemap_array[i,j] = tilemap_get(tilemap,i,j);
		}
	}
	
	var file_name = "collisions_array.txt"
	
	//create file to save array
	var file = file_text_open_write(file_name)
	
	show_debug_message(tilemap_array);
	
	//scr_array_to_file(file_name,tilemap_array);
	
}
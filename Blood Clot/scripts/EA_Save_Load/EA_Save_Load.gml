/// This script contains the following functions for saving and loading autotiles:
///
///		ea_save(filename)
///		ea_load(filename)
///


///	@function						ea_save(filename);
///	param	{string}	filename	The name of the file to use WITHOUT the extension type

///	@description		This function can be used to save out the autowall setup of the
///						current room. Simply give the filename to use and all the relevant
///						autowall data will be saved to the file, ready to be loaded back
///						into the game using the "ea_load()" function.

function ea_save(filename)
{
// Check filename is valid
if !is_string(filename)
	{
	ea_log("ea_save - ERROR! Filename not a string.")
	return false;
	}

// Create a buffer and save the required information to it
var _fname = filename;
var _buff = buffer_create(1, buffer_grow, 1);
if global.EA_Type == ea_instances
	{
	buffer_write(_buff, buffer_bool, 0);
	var _name = sprite_get_name(global.EA_Image);
	buffer_write(_buff, buffer_string, _name);
	}
else
	{
	buffer_write(_buff, buffer_bool, 1);
	var _name = tileset_get_name(global.EA_Image);
	buffer_write(_buff, buffer_string, _name);
	}
buffer_write(_buff, buffer_s16, global.EA_Size);
buffer_write(_buff, buffer_s8, global.EA_Mode);

var _grid = ds_grid_write(global.EA_Grid);
buffer_write(_buff, buffer_string, _grid);

// Remove any previous file with the same name
if file_exists(_fname + ".dat")
	{
	file_delete(_fname + ".dat");
	}

// Save out the autowall data
buffer_save(_buff, _fname + ".dat");

ea_log("ea_save - Autowall room file saved correctly.");
return true;
}


///	@function						ea_load(filename);
///	param	{string}	filename	The name of the file to use WITHOUT the extension type

///	@description		This function can be used to load in autowall data that has been saved
///						previously using the function "ea_save()". You supply the filename
///						to load and the function will re-create the saved autowall data on the 
///						layer specified when you called the autowall setup function. Note that 
///						if the layer has any autowall data on it, then this will be cleared.

function ea_load(filename)
{
// Check the filename is valid
if !is_string(filename)
	{
	ea_log("ea_load - ERROR! Filename not a string.")
	return false;
	}

// Load the aotwall data and check it appears valid
var _fname = filename;
var _buff = buffer_load(_fname + ".dat");
if !buffer_exists(_buff)
	{
	ea_log("ea_load - ERROR! Buffer could not be loaded from file.")
	return false;
	}
else if buffer_get_size(_buff) == 0
	{
	ea_log("ea_load - ERROR! Loaded buffer is empty.")
	buffer_delete(_buff);
	return false;
	}

// Parse the autowall data...
var _type = ea_instances;
if buffer_read(_buff, buffer_bool) == 1
	{
	_type = ea_tiles;
	}
var _asset = buffer_read(_buff, buffer_string);
var _size = buffer_read(_buff, buffer_s16);
var _mode = buffer_read(_buff, buffer_s8);
var _grid = buffer_read(_buff, buffer_string);
buffer_delete(_buff);

// Clear existing autowall instances
with (obj_EA_Wall_Parent)
	{
	instance_destroy();
	}
if layer_tilemap_exists(global.EA_Layer, global.EA_Tilemap)
	{
	layer_tilemap_destroy(global.EA_Tilemap);
	}


// Convert parsed data into autowall values
var _image = asset_get_index(_asset);
var _rw = room_width div _size;
var _rh = room_height div _size;
var _tm = -1;
if _type == ea_tiles
	{
	var _tm = layer_tilemap_create(global.EA_Layer, 0, 0, _image, _rw, _rh);
	}
var _tgrid = ds_grid_create(_rw, _rh);
ds_grid_read(_tgrid, _grid);
for (var j = 0; j < _rh; ++j;)
	{
	for (var i = 0; i < _rw; ++i;)
		{
		if _tgrid[# i, j] != 0
			{
			if _type == ea_instances
				{
				instance_create_layer(i * _size, j * _size, global.EA_Layer, obj_EA_Wall_Parent);
				}
			else tilemap_set(_tm, 1, i, j);
			}
		}
	}
ds_grid_destroy(_tgrid);
if _tm != -1 global.EA_Tilemap = _tm;

// Re-reate the saved room from the data
return ea_setup(_mode, _type, _image, global.EA_Layer, _size);
}





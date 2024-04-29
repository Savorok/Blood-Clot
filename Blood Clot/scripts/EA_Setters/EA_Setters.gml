/// The following functions can be used to set information in the autowall engine:
///
///		ea_set_mode(mode, image, size, clear)
///		ea_set_type(type, image, copy)
///		ea_set_image(image)
///		ea_set_debug(enable)
///		


/// @function				ea_set_mode(mode, image, size, clear);
///	@param	{int}	mode	The autotile mode to set, either 16 or 47.
///	@param	{int}	image	The autotile image to use, either a sprite asset or a tileset asset
///	@param	{int}	size	The autotile cell size (in pixels)
///	@param	{bool}	clear	Whether to attempt to clear the existing autowall tiles (true) or not (false)

/// @description	This function will set the autowall mode as well as the image asset used and
///					the cell size. You can also set whether to clear the current set of autowall
///					cells or not. When set to "false" this will attempt to change the chosen autowall
///					image for all the tiles/istances in the room to the given image.
	
function ea_set_mode(mode, image, size, clear)
{
// Check the current mode
if global.EA_Mode != mode
	{
	// Check the new mode is an appropriate value
	if (mode == 16 || mode == 47)
		{
		// Check to see if we are clearing all the current autowall cells
		if clear
			{
			// Check the current autowall "type" and remove the instances or tiles as required
			if global.EA_Type == ea_instances
				{
				with (obj_EA_Wall_Parent)
					{
					instance_destroy();
					}
				}
			else
				{
				layer_tilemap_destroy(global.EA_Tilemap);
				}
			}
		ea_log("ea_set_mode - Mode changed to " + string(mode) + ".");
		// Re-initialise the autowall scripts using the new mode and the given and current values
		return ea_setup(mode, global.EA_Type, image, global.EA_Layer, size);
		}
	else
		{
		ea_log("ea_set_mode - ERROR! Given mode " + string(mode) + " is invalid.");
		}
	}
else
	{
	ea_log("ea_set_mode - Warning! Mode not changed as it is the same (currently " + string(mode) + ").");
	}
return false;
}


/// @function				ea_set_type(type, image, copy);
///	@param	{int}	type	Set the autowall type, either ea_instances or ea_tiles.
///	@param	{int}	image	Set the autowall image asset to use, either a sprite index or a tileset index.
///	@param	{bool}	copy	Set whether to copy existing autowall tiles/instances to new type or not (true to copy, false to destroy)

/// @description	This function will set the autowall type, which can be either ea_instances
///					or ea_tiles. You also choose whether to copy the existing instance/tile
///					data to the new type. If set to true, then the existing autowall data
///					will be converted into the new type, and if set to false, then the existing 
///					autowall data will be destroyed.

function ea_set_type(type, image, copy)
{
// Check the given type is not the same as the current type
if type != ea_get_type()
	{
	var _tm = ea_get_tilemap();
	var _sz = ea_get_size();
	var _layer = ea_get_layer();
	// Check the given type and act accordingly
	if type == ea_instances
		{
		// Check to see if a tilemap actually exists
		if layer_tilemap_exists(_layer, _tm)
			{
			// Check for copying any tiles into instances
			if copy == true
				{
				// Remove any existing autowall instances
				if instance_exists(obj_EA_Wall_Parent)
					{
					with (obj_EA_Wall_Parent) instance_destroy();
					}
				// Loop through the tilemap cells and check if any are greater than 0
				var _tw = tilemap_get_width(_tm);
				var _th = tilemap_get_height(_tm);
				for (var j = 0; j < _th; ++j;)
					{
					for (var i = 0; i < _tw; ++i;)
						{
						var _td = tilemap_get(_tm, i, j);
						if _td > 0
							{
							// Tile is occupied so convert to an instance
							with (instance_create_layer(i * _sz, j * _sz, _layer, obj_EA_Wall_Parent))
								{
								sprite_index = image;
								image_speed = 0;
								image_index = _td;
								global.EA_Grid[# i, j] = id;
								}
							}
						}
					}
				}
			// Remove the tilemap from the layer
			layer_tilemap_destroy(_tm);
			}
		ea_log("ea_set_type - Type changed to Instances.");
		// Set globals
		global.EA_Type = type;
		global.EA_Image = image;
		return true;
		}
	else if type == ea_tiles
		{
		// Remove the current tilemap.
		if layer_tilemap_exists(_layer, _tm)
			{
			layer_tilemap_destroy(_tm);
			}
		// Create a new tilemap
		_tm = layer_tilemap_create(_layer, 0, 0, image, _sz, _sz);
		// Check for copying any tiles into instances
		if copy == true
			{
			// Loop through all instances and set the appropriate tile
			with (obj_EA_Wall_Parent)
				{
				tilemap_set_at_pixel(_tm, image_index, x, y);
				global.EA_Grid[# x div global.EA_Size, y div global.EA_Size] = image_index;
				}
			}
		// Remove the instances from the room
		with (obj_EA_Wall_Parent)
			{
			instance_destroy();
			}
		ea_log("ea_set_type - Type changed to Tiles.");
		// Set globals
		global.EA_Type = type;
		global.EA_Image = image;
		global.EA_Tilemap = _tm;
		return true;
		}
	else
		{
		ea_log("ea_set_type - ERROR! Invalid autowall type given " + string(_type) + ".");
		}
	}
else
	{
	ea_log("ea_set_type - Warning! Given autowall type is already set (" + _type + ".");
	}

return false;
}


/// @function				ea_set_image(image);
///	@param	{int}	image	The image asset to use, either a tileset index or a sprite index.

/// @description	This function will set the current autowall image asset, either
///					a tileset index or a sprite index. Note that if you supply an
///					asset type that is not appropriate for the autowall type then 
///					nothing will change and an error will be output to the console.

function ea_set_image(image)
{
var _error = false;
// Check current type
if global.EA_Type == ea_instances
	{
	// Check the sprite is valid
	if sprite_exists(image)
		{
		// Set the sprite index
		global.EA_Image = image;
		with (obj_EA_Wall_Parent)
			{
			sprite_index = global.EA_Image;
			}
		}
	else _error = true;
	}
else
	{
	// Check the tilset is valid
	if tileset_get_name(image) != ""
		{
		// Set the tileset to the tilemap
		global.EA_Image = image;
		tilemap_tileset(global.EA_Tilemap, global.EA_Image);
		}
	else _error = true;
	}

if _error
	{
	ea_log("ea_set_image - ERROR! Invalid image asset given for autowall type (" + global.EA_Type + ").");
	return false;
	}
else
	{
	ea_log("ea_set_image - Image changed.");
	return true;
	}
}


/// @function					ea_set_debug(enable);
/// @param	{bool}	enable		Enable debug mode (true or false)

/// @description	This function will enable or disable debug mode for the autowall system.
///					Note that this will require an object in the room that has the function
///					"ea_draw_debug()" in it's Draw (or Draw End) event, otherwise nothing 
///					will happen.
	
function scr_EA_Set_Debug(enable)
{
global.EA_Debug = enable;
}

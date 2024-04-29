/// This script contains the functions and global variables required to setup the
///	main Essential Autowall engine.
///
/// The functions included in this script are:
///
///		ea_setup(mode, type, image, layer_id, size)
///		ea_create_from_tiles(src_layer, destroy)
///		ea_create_from_instances(object, destroy)
///		ea_autowall_index(_x, _y)
///		ea_log(val)
///		ea_draw_debug();
///


// Initialise globals and macros
#macro ea_instances	0
#macro ea_tiles		1

global.EA_Mode = 16;			// The autowall mode, either 16 or 47
global.EA_Type = ea_instances	// The autowall type, either ea_instances or ea_tiles
global.EA_Image = -1;			// The mage to use for the autowall, either a sprite index or a tilset index
global.EA_Layer = -1;			// The layer the autowall tiles/instances will be on
global.EA_Tilemap = -1;			// The tilemap that the autowall tiles are on (-1 if using instances)
global.EA_Size = 32;			// The size (length and height) of a single autowall cell, in pixels
global.EA_Grid = -1;			// The autowall DS grid ID, used for certain features and debugging
global.EA_Debug = false;		// The autowall debug mode controller


/// @function					ea_setup(mode, type, image, layer_id, size);
/// @param	{int}	mode		The autowall mode to use, either 16 or 47
/// @param	{int}	type		The autowall type, either ea_instances or ea_tiles
/// @param	{int}	image		The image resource to use, either a sprite or a tileset (depending on the "type" argument set)
/// @param	{int}	layer_id	The layer to create the autowalls on
/// @param	{int}	size		The size of each tile in the sprite or tileset.

/// @description	This function will initialise the essential autowall scripts in a room, and 
///					should be called when a room with autowall features is started, before calling
///					any other autowall scripts.
///
///					The function will set the autowall mode (either 16 or 47) and the wall type 
///					(either "instances" or "tiles") and you need to supply a sprite or tileset 
///					asset that has been correctly formatted (ie: all tiles/sub-images must be 
///					square and follow the order of the template sprites included with this asset).
///					You also need to supply the layer to create the autoall instances/tiles on.
///					Note that if the layer does not exist, then the layer that the instance running
///					the setup code is on will be used, and if the layer does not have a tilemap 
///					assigned to it (and the type is ea_tiles), then one will be created. Finally,
///					you need to give the size (in pixels) of the individual autowall cell.
	
function ea_setup(mode, type, image, layer_id, size)
{
// Initialise autowall cell size
global.EA_Size = size;

// Check the mode
if mode != 16 && mode != 47
	{
	ea_log("ea_setup - ERROR! Script cannot be initialised with mode other than 16 or 47.");
	return -1;
	}
global.EA_Mode = mode;

// Check the type
if type != ea_instances && type != ea_tiles
	{
	ea_log("ea_setup - ERROR! Script cannot be initialised with type other than Instances or Tiles.");
	return -1;
	}
global.EA_Type = type;

// Check whether a sprite or a tileset has been given
if !sprite_exists(image)
	{
	if tileset_get_name(image) == ""
		{
		ea_log("ea_setup - ERROR! Given sprite or tileset does not exist.");
		return -1;
		}
	}
if global.EA_Type == ea_instances
	{
	if !sprite_exists(image)
		{
		ea_log("ea_setup - ERROR! Initialisation type is given as Instances but a tileset asset has been supplied.");
		return -1;
		}
	}
	else
	{
	if tileset_get_name(image) == ""
		{
		ea_log("ea_setup - ERROR! Initialisation type is given as Tiles but a sprite asset has been supplied.");
		return -1;
		}
	}
// Set the image to be used
global.EA_Image = image;

// Check the layer given
var _l = layer_id;
if is_string(_l)
	{
	_l = layer_get_id(_l);
	}
if !layer_exists(_l)
	{
	global.EA_Layer = layer;
	ea_log("ea_setup - WARNING! Given layer ID does not exist. Defaulting to controller instance layer.")
	}
else
	{
	global.EA_Layer = _l;
	}

// Check the tilemap exists and create one if it doesn't
if global.EA_Type == ea_tiles
	{
	var _tm = -1;
	var _elements = layer_get_all_elements(global.EA_Layer);
	for (var i = 0; i < array_length(_elements); i++;)
	   {
	   if layer_get_element_type(_elements[i]) == layerelementtype_tilemap
	      {
	      _tm = _elements[i];
		  break;
	      }
	   }
	if !layer_tilemap_exists(_l, _tm)
		{
		global.EA_Tilemap = layer_tilemap_create(_l, 0, 0, global.EA_Image, room_width div global.EA_Size, room_height div global.EA_Size);
		ea_log("ea_setup - WARNING! Layer has no tilemap assigned to it. Creating new tilemap."); 
		}
	else global.EA_Tilemap = _tm;
	}

// Initialise any existing autowall instances or tiles in the room, depending on the given "type"
switch(global.EA_Type)
	{
	case ea_instances:
		with (obj_EA_Wall_Parent)
			{
			sprite_index = global.EA_Image;
			image_speed = 0;
			image_index = ea_autowall_index(x, y);
			}
		ea_log("ea_setup - Existing Instances Initialised.");
		break;
	case ea_tiles:
		var _tw = tilemap_get_width(global.EA_Tilemap);
		var _th = tilemap_get_height(global.EA_Tilemap);
		var _tm = global.EA_Tilemap;
		var _sz = global.EA_Size;
		tilemap_tileset(global.EA_Tilemap, global.EA_Image);
		var _index = 0;
		for (var j = 0; j < _th; ++j;)
			{
			for (var i = 0; i < _tw; ++i;)
				{
				if tilemap_get(_tm, i, j) > 0
					{
					_index = ea_autowall_index(i * _sz, j * _sz);
					tilemap_set(_tm, _index, i, j);
					}
				}
			}
		ea_log("ea_setup - Existing Tiles Initialised.");
		break;
	}

// Store appropriate values in the autowall grid
// Initialise variables
var _sz = global.EA_Size;
var _tm = global.EA_Tilemap;
var _gw = room_width div _sz;
var _gh = room_height div _sz;

// Check for previous iterations of the grid and remove if found
if ds_exists(global.EA_Grid, ds_type_grid)
	{
	// Destroy old grid
	ds_grid_destroy(global.EA_Grid);
	}

// Create new grid and clear it
global.EA_Grid = ds_grid_create(_gw, _gh);
ds_grid_clear(global.EA_Grid, 0);


// Populate grid based on autowall tiles/instances
switch(global.EA_Type)
	{
	case ea_instances:
		with (obj_EA_Wall_Parent)
			{
			global.EA_Grid[# x div _sz, y div _sz] = id;
			}
		break;
	case ea_tiles:
		for (var j = 0; j < _gh; ++j;)
			{
			for (var i = 0; i < _gw; ++i;)
				{
				var _index = tilemap_get(_tm, i, j);
				if _index > 0
					{
					global.EA_Grid[# i, j] = _index;
					}
				}
			}
		break;
	}

// Finish
ea_log("ea_setup - Autowall Initialised.");
return true;
}


/// @function								ea_create_from_tiles(src_layer, destroy);
/// @param	{real/string}	src_layer		The source layer to get the autowall data from
/// @param	{bool}			destroy			Whether to destroy the source layer (true) or not (false)

/// @description			This function can be used to create autowalls from a source layer of tiles.
///							You supply the source layer to extract the autowall data from, and all 
///							the autowall cells will be populated using this data. You can then choose 
///							to destroy this layer or not, which is useful if you want to maintain the 
///							source layer for collision checks while having the autowall layer overlaying 
///							it. If destroy is set to true, then the source layer will be destroyed at 
///							the end of this function.
///							
///							IMPORTANT!!!! This function MUST be called after the setup function.
	
function ea_create_from_tiles(src_layer, destroy)
{
// Initialise variables
var _size = global.EA_Size;
var _type = global.EA_Type;
var _layer = global.EA_Layer;
var _tilemap = global.EA_Tilemap;
var _src_tilemap = -1;

// Check the layer given
if is_string(src_layer)
	{
	src_layer = layer_get_id(src_layer);
	}
if !layer_exists(src_layer)
	{
	ea_log("ea_create_from_tiles - ERROR! Given layer ID does not exist.")
	return false;
	}
else
	{
	_src_tilemap = layer_tilemap_get_id(src_layer);
	if !layer_tilemap_exists(src_layer, _src_tilemap)
		{
		ea_log("ea_create_from_tiles - ERROR! Layer does not contain any tile data.")
		return false;
		}
	}

// Check the source layer tilemap is the correct format
var _tilew = tilemap_get_tile_width(_src_tilemap);
var _tileh = tilemap_get_tile_height(_src_tilemap);
if _tilew != _size || _tileh != _size
	{
	ea_log("ea_create_from_tiles - ERROR! Tilemap cell size is differnt to the autowall tile size.")
	return false;
	}

// Convert tiles or instances from the source layer into autowall cells
var _tw = tilemap_get_width(_src_tilemap);
var _th = tilemap_get_height(_src_tilemap);
for (var j = 0; j < _th; ++j;)
	{
	for (var i = 0; i < _tw; ++i;)
		{
		if tilemap_get(_src_tilemap, i, j) > 0
			{
			switch (_type)
				{
				case ea_instances:
					instance_create_layer(i * _size, j * _size, _layer, obj_EA_Wall_Parent);
					break;
				case ea_tiles:
					tilemap_set(_tilemap, 1, i, j);
					break;
				}
			}
		}
	}

// Destroy source layer if required
if destroy
	{
	layer_destroy(src_layer);
	}

// Re-initialise the autowall scripts including the new data
ea_log("ea_create_from_tiles - Autowall updated from tiles correctly.");
return ea_setup(global.EA_Mode, _type, global.EA_Image, _layer, _size);
}


/// @function								ea_create_from_instances(object, destroy);
/// @param	{string}		object			The object to use to get the autowall data
/// @param	{bool}			destroy			Whether to destroy the source layer (true) or not (false)

/// @description			This function can be used to create autowalls from source instances placed
///							in the room. You supply the object index of the instances to extract the 
///							autowall data from, and all the autowall cells will be populated using 
///							this data. You can then choose to destroy these instances or not, which 
///							is useful if you want to maintain the instances for collision checks while 
///							having the autowall layer overlaying them. If destroy is set to true, then 
///							the source instances will be destroyed at the end of this function. It is 
///							worth noting that this will target all instances of the given type regardless
///							of the layer they are on.
///
///							IMPORTANT!!!! This function MUST be called after the setup function.

function ea_create_from_instances(object, destroy)
{
// Initialise variables
var _size = global.EA_Size;
var _type = global.EA_Type;
var _layer = global.EA_Layer;
var _tilemap = global.EA_Tilemap;

// Check the instance exists in the room
if !instance_exists(object)
	{
	ea_log("ea_create_from_instances - ERROR! No instance of the given object exists in the room.")
	return false;
	}

// Convert the instances into autowall cells
with (object)
	{
	switch(_type)
		{
		case ea_instances:
			if !instance_position(x, y, obj_EA_Wall_Parent)
				{
				instance_create_layer(x, y, _layer, obj_EA_Wall_Parent);
				}
			break;
		case ea_tiles:
			var _cellx = x div _size;
			var _celly = y div _size;
			tilemap_set(_tilemap, 1, _cellx, _celly);
		break;
		}
	if destroy
		{
		instance_destroy();
		}
	}

// Re-initialise the autowall scripts including the new data
ea_log("ea_create_from_instances - Autowall updated from instances correctly.");
return ea_setup(global.EA_Mode, _type, global.EA_Image, _layer, _size);
}


/// @function			ea_autowall_index(_x, _y);
///	@param	{real}	_x	The x position to get the autowall index for
///	@param	{real}	_y	The y position to get the autowall index for

/// @description	DO NOT EDIT!!!! This function will return the correct image 
///					index or tile index for the autowall at the given position.

function ea_autowall_index(_x, _y)
{
// Initialise variables
var _cellx = _x div global.EA_Size;
var _celly = _y div global.EA_Size;
var _sz = global.EA_Size;

// Check current autowall "type"
switch(global.EA_Type)
	{
	case ea_instances:
		switch(global.EA_Mode)
			{
			case 16:
		#region // 16 image index autowall instances
				var _val = 0;
				if place_meeting(_x, _y - _sz, obj_EA_Wall_Parent)
					{
					_val += 1;
					}
				if place_meeting(_x, _y + _sz, obj_EA_Wall_Parent)
					{
					_val += 8;
					}
				if place_meeting(_x - _sz, _y, obj_EA_Wall_Parent)
					{
					_val += 2;
					}
				if place_meeting(_x + _sz, _y, obj_EA_Wall_Parent)
					{
					_val += 4;
					}
				_val += 1;
				break;
		#endregion
			case 47:
		#region // 47 image index autowall instances
				var _val = 46;
				if place_meeting(_x, _y - _sz, obj_EA_Wall_Parent)
					{
					_val = 44;
					if place_meeting(_x + _sz, _y, obj_EA_Wall_Parent)
					    {
					    _val = 41;
					    if place_meeting(_x, _y + _sz, obj_EA_Wall_Parent)
					        {
					        _val = 19;
					        if place_meeting(_x - _sz, _y, obj_EA_Wall_Parent)
					            {
					            _val = 15;
					            if place_meeting(_x + _sz, _y - _sz, obj_EA_Wall_Parent)
					                {
					                _val = 13;
					                if place_meeting(_x + _sz, _y + _sz, obj_EA_Wall_Parent)
					                    {
					                    _val = 9;
					                    if place_meeting(_x - _sz, _y + _sz, obj_EA_Wall_Parent)
					                        {
					                        _val = 1;
					                        if place_meeting(_x - _sz, _y - _sz, obj_EA_Wall_Parent) _val = 47;
					                        }
					                    else if place_meeting(_x - _sz, _y - _sz, obj_EA_Wall_Parent) _val = 8;
					                        }
					                    else if place_meeting(_x - _sz, _y + _sz, obj_EA_Wall_Parent)
					                        {
					                        _val = 5;
					                        if place_meeting(_x - _sz, _y - _sz, obj_EA_Wall_Parent) _val = 4;
					                        }
					                    else if place_meeting(_x - _sz, _y - _sz, obj_EA_Wall_Parent) _val = 12;
					                    }
					                else if place_meeting(_x + _sz, _y + _sz, obj_EA_Wall_Parent)
					                    {
					                    _val = 11;
					                    if place_meeting(_x - _sz, _y + _sz, obj_EA_Wall_Parent)
					                        {
					                        _val = 3;
					                        if place_meeting(_x - _sz, _y - _sz, obj_EA_Wall_Parent) _val = 2;
					                        }
					                    else if place_meeting(_x - _sz, _y - _sz, obj_EA_Wall_Parent) _val = 10;
					                    }
					                else if place_meeting(_x - _sz, _y + _sz, obj_EA_Wall_Parent)
					                    {
					                    _val = 7;
					                    if place_meeting(_x - _sz, _y - _sz, obj_EA_Wall_Parent) _val = 6;
					                    }
					                else if place_meeting(_x - _sz, _y - _sz, obj_EA_Wall_Parent) _val = 14;
					                }
					            else if place_meeting(_x + _sz, _y - _sz, obj_EA_Wall_Parent)
					                {
					                _val = 18;
					                if place_meeting(_x + _sz, _y + _sz, obj_EA_Wall_Parent) _val = 16;
					                }
					            else if place_meeting(_x + _sz, _y + _sz, obj_EA_Wall_Parent) _val = 17;
					            }
					        else if place_meeting(_x - _sz, _y, obj_EA_Wall_Parent)
					            {
					            _val = 31;
					            if place_meeting(_x + _sz, _y - _sz, obj_EA_Wall_Parent)
					                {
					                _val = 29;
					                if place_meeting(_x - _sz, _y - _sz, obj_EA_Wall_Parent) _val = 28;
					                }
					            else if place_meeting(_x - _sz, _y - _sz, obj_EA_Wall_Parent) _val = 30;
					            }
					        else if place_meeting(_x + _sz, _y - _sz, obj_EA_Wall_Parent) _val = 40;
					        }
					    else if place_meeting(_x, _y + _sz, obj_EA_Wall_Parent)
					    {
					    _val = 32;
					    if place_meeting(_x - _sz, _y, obj_EA_Wall_Parent)
					        {
					        _val = 27;
					        if place_meeting(_x - _sz, _y + _sz, obj_EA_Wall_Parent)
					            {
					            _val = 26;
					            if place_meeting(_x - _sz, _y - _sz, obj_EA_Wall_Parent) _val = 24;
					            }
					        else if place_meeting(_x - _sz, _y - _sz, obj_EA_Wall_Parent) _val = 25;
					        }
					    }
					else if place_meeting(_x - _sz, _y, obj_EA_Wall_Parent)
					    {
					    _val = 39;
					    if place_meeting(_x - _sz, _y - _sz, obj_EA_Wall_Parent) _val = 38;
					    }
					}
				else if place_meeting(_x + _sz, _y, obj_EA_Wall_Parent)
					{
					_val = 43;
					if place_meeting(_x, _y + _sz, obj_EA_Wall_Parent)
					    {
					    _val = 35;
					    if place_meeting(_x - _sz, _y, obj_EA_Wall_Parent)
					        {
					        _val = 23;
					        if place_meeting(_x + _sz, _y + _sz, obj_EA_Wall_Parent)
					            {
					            _val = 22;
					            if place_meeting(_x - _sz, _y + _sz, obj_EA_Wall_Parent) _val = 20;
					            }
					        else if place_meeting(_x - _sz, _y + _sz, obj_EA_Wall_Parent) _val = 21;
					        }
					    else if place_meeting(_x + _sz, _y + _sz, obj_EA_Wall_Parent) _val = 34;
					    }
					else if place_meeting(_x - _sz, _y, obj_EA_Wall_Parent)
					    {
					    _val = 33;
					    }
					}
				else if place_meeting(_x, _y + _sz, obj_EA_Wall_Parent)
					{
					_val = 42;
					if place_meeting(_x - _sz, _y, obj_EA_Wall_Parent)
					    {
					    _val = 37;
					    if place_meeting(_x - _sz, _y + _sz, obj_EA_Wall_Parent) _val = 36;
					    }
					}
				else if place_meeting(_x - _sz, _y, obj_EA_Wall_Parent)
					{
					_val = 45;
					}
				break;
		#endregion
			}
		break;
	case ea_tiles:
		var _t = global.EA_Tilemap;
		switch(global.EA_Mode)
			{
			case 16:
		#region // 16 image autowall tiles
				var _val = 0;
				if tilemap_get(_t, _cellx, _celly - 1) != 0
					{
					_val += 1;
					}
				if tilemap_get(_t, _cellx, _celly + 1) != 0 
					{
					_val += 8;
					}
				if tilemap_get(_t, _cellx - 1, _celly) != 0
					{
					_val += 2;
					}
				if tilemap_get(_t, _cellx + 1, _celly) != 0
					{
					_val += 4;
					}
				_val += 1;
				break;
		#endregion
			case 47:
		#region // 47 image autowall tiles
				var _val = 46;
				if tilemap_get(_t, _cellx, _celly) != 0
					{
					if tilemap_get(_t, _cellx, _celly - 1)
						{
						_val = 44;
						if tilemap_get(_t, _cellx + 1, _celly)
						    {
						    _val = 41;
						    if tilemap_get(_t, _cellx, _celly + 1)
						        {
						        _val = 19;
						        if tilemap_get(_t, _cellx - 1, _celly)
						            {
						            _val = 15;
						            if tilemap_get(_t, _cellx + 1, _celly - 1)
						                {
						                _val = 13;
						                if tilemap_get(_t, _cellx + 1, _celly + 1)
						                    {
						                    _val = 9;
						                    if tilemap_get(_t, _cellx - 1, _celly + 1)
						                        {
						                        _val = 1;
						                        if tilemap_get(_t, _cellx - 1, _celly - 1) _val = 47;
						                        }
						                    else if tilemap_get(_t, _cellx - 1, _celly - 1) _val = 8;
						                        }
						                    else if tilemap_get(_t, _cellx - 1, _celly + 1)
						                        {
						                        _val = 5;
						                        if tilemap_get(_t, _cellx - 1, _celly - 1) _val = 4;
						                        }
						                    else if tilemap_get(_t, _cellx - 1, _celly - 1) _val = 12;
						                    }
						                else if tilemap_get(_t, _cellx + 1, _celly + 1)
						                    {
						                    _val = 11;
						                    if tilemap_get(_t, _cellx - 1, _celly + 1)
						                        {
						                        _val = 3;
						                        if tilemap_get(_t, _cellx - 1, _celly - 1) _val = 2;
						                        }
						                    else if tilemap_get(_t, _cellx - 1, _celly - 1) _val = 10;
						                    }
						                else if tilemap_get(_t, _cellx - 1, _celly + 1)
						                    {
						                    _val = 7;
						                    if tilemap_get(_t, _cellx - 1, _celly - 1) _val = 6;
						                    }
						                else if tilemap_get(_t, _cellx - 1, _celly - 1) _val = 14;
						                }
						            else if tilemap_get(_t, _cellx + 1, _celly - 1)
						                {
						                _val = 18;
						                if tilemap_get(_t, _cellx + 1, _celly + 1) _val = 16;
						                }
						            else if tilemap_get(_t, _cellx + 1, _celly + 1) _val = 17;
						            }
						        else if tilemap_get(_t, _cellx - 1, _celly)
						            {
						            _val = 31;
						            if tilemap_get(_t, _cellx + 1, _celly - 1)
						                {
						                _val = 29;
						                if tilemap_get(_t, _cellx - 1, _celly - 1) _val = 28;
						                }
						            else if tilemap_get(_t, _cellx - 1, _celly - 1) _val = 30;
						            }
						        else if tilemap_get(_t, _cellx + 1, _celly - 1) _val = 40;
						        }
						    else if tilemap_get(_t, _cellx, _celly + 1)
						    {
						    _val = 32;
						    if tilemap_get(_t, _cellx - 1, _celly)
						        {
						        _val = 27;
						        if tilemap_get(_t, _cellx - 1, _celly + 1)
						            {
						            _val = 26;
						            if tilemap_get(_t, _cellx - 1, _celly - 1) _val = 24;
						            }
						        else if tilemap_get(_t, _cellx - 1, _celly - 1) _val = 25;
						        }
						    }
						else if tilemap_get(_t, _cellx - 1, _celly)
						    {
						    _val = 39;
						    if tilemap_get(_t, _cellx - 1, _celly - 1) _val = 38;
						    }
						}
					else if tilemap_get(_t, _cellx + 1, _celly)
						{
						_val = 43;
						if tilemap_get(_t, _cellx, _celly + 1)
						    {
						    _val = 35;
						    if tilemap_get(_t, _cellx - 1, _celly)
						        {
						        _val = 23;
						        if tilemap_get(_t, _cellx + 1, _celly + 1)
						            {
						            _val = 22;
						            if tilemap_get(_t, _cellx - 1, _celly + 1) _val = 20;
						            }
						        else if tilemap_get(_t, _cellx - 1, _celly + 1) _val = 21;
						        }
						    else if tilemap_get(_t, _cellx + 1, _celly + 1) _val = 34;
						    }
						else if tilemap_get(_t, _cellx - 1, _celly)
						    {
						    _val = 33;
						    }
						}
					else if tilemap_get(_t, _cellx, _celly + 1)
						{
						_val = 42;
						if tilemap_get(_t, _cellx - 1, _celly)
						    {
						    _val = 37;
						    if tilemap_get(_t, _cellx - 1, _celly + 1) _val = 36;
						    }
						}
					else if tilemap_get(_t, _cellx - 1, _celly)
						{
						_val = 45;
						}
					}
				else _val = 0;
				break;
		#endregion
			}
		break;
	}
return _val;
}


///	@function						ea_log(val);
///	@param	{real/string}	val		The value (a real or a string) to log.

///	@description			This function is a wrapper function for the GML function
///							show_debug_message(). You can give a string or a real 
///							as a value, and the function will display a message in
///							in the output console appended with an Essental Autowall
///							identifier.

function ea_log(val)
{
if !is_string(val)
	{
	val = string(val);
	}
show_debug_message(":::::::::: Essential Autowall: " + val);
}


///	@function		ea_draw_debug();

///	@description	This function should go in the Draw (or Draw End) event of some controller
///					object in the room. It will draw a debug grid that shows the instances/tiles
///					currently forming the autowall system. Note that this will SERIOUSLY affect
///					framerate.

function ea_draw_debug()
{
// Check debug state
if ea_get_debug()
	{
	// Initialsie variables
	var _sz = ea_get_size();
	var _grid = ea_get_grid();
	var _type = ea_get_type();
	var _gw = ds_grid_width(_grid);
	var _gh = ds_grid_height(_grid);
	var _a = draw_get_alpha();
	var _c = draw_get_colour();
	var _h = draw_get_halign();
	var _xs = _sz / 64;
	// Set draw values
	draw_set_alpha(0.25);
	draw_set_colour(c_red);
	draw_set_halign(fa_center);
	// Loop through the room width and height (in cells)
	for (var j = 0; j < _gh; ++j;)
		{
		for (var i = 0; i < _gw; ++i;)
			{
			var _tx = i * _sz;
			var _ty = j * _sz;
			// Draw the debug grid sprite
			draw_sprite_ext(spr_EA_Debug, 0, _tx, _ty, _xs, _xs, 0, c_red, 0.25);
			// Draw debug values based on instances or tiles
			if _grid[# i, j] > 0
				{
			if _type == ea_instances
					{
					draw_text(_tx + (_sz / 2), _ty + (_sz / 2) + 10, string(_grid[# i, j].image_index));
					draw_text_transformed(_tx + (_sz / 2), _ty + (_sz / 2) - 30, string(_grid[# i, j]), 0.6, 0.6, 0);
					}
				else
					{
					draw_text(_tx + (_sz / 2), _ty + (_sz / 2) + 10, string(_grid[# i, j]));
					}
				}
			else draw_text(_tx + (_sz / 2), _ty + (_sz / 2) - 10, "0");
			}
		}
	// Reset draw values
	draw_set_alpha(_a);
	draw_set_colour(_c);
	draw_set_halign(_h);
	}
}


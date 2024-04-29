/// The functions listed in this script can all be used to edit objects 
///	or tiles and have them autowall correctly.
///
///	The functions in this script are:
///
///		ea_add_single(_x, _y, [obj])
///		ea_add_circle(_x, _y, rad, [obj])
///		ea_add_rect(_x, _y, width, height, [obj])
///		ea_remove_single(_x, _y)
///		ea_remove_circle(_x, _y, rad)
///		ea_remove_rect(_x, _y, width, height, [obj])
///		ea_clear_all()
///		


/// @function				ea_add_single(_x, _y, [obj]);
///	@param	{real}	_x		The X position to add the autowall instance/tile to
///	@param	{real}	_y		The y position to add the autowall instance/tile to
///	@param	{int}	obj		OPTIONAL! The object to use for instance-based autowalls

/// @description	This function can be used to add an instance or a tile to the autowall
///					layer. It will adapt all the surrounding autowall instances/tiles to 
///					correctly merge with the new one. By default, when using instances for
///					autowall, the instance created will be of the object "obj_EA_Wall_Parent",
///					but you can supply another object type to use if required, however this
///					MUST be a child of the object "obj_EA_Wall_Parent", otherwise the scripts
///					won't work.
	
function ea_add_single(_x, _y)
{
// Initialise vars
var _sz = global.EA_Size;
var _rw = (room_width div _sz);
var _rh = (room_height div _sz)
var _cellx = clamp(_x div _sz, 0, _rw);
var _celly = clamp(_y div _sz, 0, _rh);
var _cx = _cellx * _sz;
var _cy = _celly * _sz;

// Check for custom object
var _obj = obj_EA_Wall_Parent;
if argument_count > 2
	{
	var _obj = argument[2];
	}

// Check if given position is within the room bounds
if _cellx < 0 || _cellx > _rw - 1 || _celly < 0 || _celly > _rh - 1
	{
	ea_log("ea_add_single - ERROR! Cell position outside of autowall bounds.");
	}
else
	{
	// Add an instance or a tile to the given position cell based on the current autowall "type"
	switch(global.EA_Type)
		{
		case ea_instances:
			// Check no instance currently occupies the position
			if !instance_position(_cx, _cy, obj_EA_Wall_Parent)
				{
				// Create instance
				var _inst = instance_create_layer(_cx, _cy, global.EA_Layer, _obj);
				var _tx = _x - _sz;
				var _ty = _y - _sz;
				// Set the autowall cell DS grid
				with (_inst)
					{
					image_speed = 0;
					sprite_index = global.EA_Image;
					global.EA_Grid[# _cellx, _celly] = id;
					}
				// Loop through the area around the given cell position and autowall instances
				for (var j = 0; j < 3; ++j;)
					{
					for (var i = 0; i < 3; ++i;)
						{
						with (instance_position(_tx + (i * _sz), _ty + (j * _sz), obj_EA_Wall_Parent))
							{
							image_index = ea_autowall_index(x, y);
							}
						}
					}
				}
			break;
		case ea_tiles:
			// Get the autowall tilemap ID
			var _tm = global.EA_Tilemap;
			var _tx = _x - _sz;
			var _ty = _y - _sz;
			// Set the given tilemap cell to a value greater than 0 so it's detected in the subsequent loop
			tilemap_set(_tm, 1, _cellx, _celly);
			// Loop through the area around the given cell position and autowall the tiles
			for (var j = 0; j < 3; ++j;)
				{
				for (var i = 0; i < 3; ++i;)
					{
					var _tl = tilemap_get(_tm, _cellx - 1 + i, _celly - 1 + j);
					if _tl != 0
						{
						var _tl = ea_autowall_index(_tx + (i * _sz), _ty + (j * _sz));
						tilemap_set(_tm, _tl, _cellx - 1 + i, _celly - 1 + j);
						}
					}
				}
			// Set the autowall cell DS grid
			global.EA_Grid[# _cellx, _celly] = tilemap_get(_tm, _cellx, _celly);
			break;
		}
	}
}


/// @function				ea_add_circle(_x, _y, rad, [obj]);
///	@param	{real}	_x		The X position to add the autowall instance/tile to
///	@param	{real}	_y		The y position to add the autowall instance/tile to
///	@param	{real}	rad		The radius of the circle to add in CELLS (minimum 1)
///	@param	{int}	obj		OPTIONAL! The object to use for instance-based autowalls

/// @description	This function can be used to add instances or tiles to a circular area around
///					the nearest cell position to the X/Y position selected, autowalling the
///					surrounding occupied cells. You give the X/Y position to add the autowalls
///					to as well as the radius of the circle in autowall cells. By default, when 
///					using instances for autowall, the instance created will be of the object 
///					"obj_EA_Wall_Parent", but you can supply another object type to use if 
///					required, however this MUST be a child of the object "obj_EA_Wall_Parent",
///					otherwise the scripts won't work.

function ea_add_circle(_x, _y, rad)
{
// Initialise variables
var _sz = global.EA_Size;
var _grid = global.EA_Grid;
var _rw = (room_width div _sz);
var _rh = (room_height div _sz)
if rad < 1 rad = 1;

// Check for custom autowall object
var _obj = obj_EA_Wall_Parent;
if argument_count > 3
	{
	var _obj = argument[3];
	}

// Get the center cell position, clamped to the room width/height
var _cellx = clamp((_x div _sz), -rad, _rw + rad - 1);
var _celly = clamp((_y div _sz), -rad, _rh + rad - 1);
// Get the total area that the circle will occupy
var _areaw = (rad * 2) + 1
var _areah = _areaw;
// Calculate the offsets from the circle origin
var _w1 = floor(_areaw / 2);
var _h1 = floor(_areah / 2);
var _w2 = _areaw - _w1;
var _h2 = _areah - _h1;
// Calculate the top left corner of the area of the circle, clamped to the room width/height
var _areax1 = clamp(_cellx - _w1, 0, _rw - 1);
var _areay1 = clamp(_celly - _h1, 0, _rh - 1);
// Calculate the bottom right corner of the area of the circle, clamped to the room width/height
var _areax2 = clamp(_cellx + _w2, 0, _rw);
var _areay2 = clamp(_celly + _h2, 0, _rh);
// Calculate the top left corner of the area to autowall, clamped to the room width/height
var _areax3 = clamp(_areax1 - 1, 0, _rw);
var _areay3 = clamp(_areay1 - 1, 0, _rh);
// Calculate the bottom right corner of the area to autowall, clamped to the room width/height
var _areax4 = clamp(_areax2 + 1, 0, _rw);
var _areay4 = clamp(_areay2 + 1, 0, _rh);

// Check which "type" of autowall is being used
switch(global.EA_Type)
	{
	case ea_instances:
		var _spr = global.EA_Image;
		var _layer = global.EA_Layer;
		// Use the DS grid functions to set the autowall grid to -4 in the circular area defined
		// This will then be used to decide where to create instances
		ds_grid_set_disk(_grid, _cellx, _celly, rad, -4);
		// Loop through the area the circle occupies and create instances as required
		for (var j = _areay1; j < _areay2; ++j;)
			{
			for (var i = _areax1; i < _areax2; ++i;)
				{
				if _grid[# i, j] == -4
					{
					var _tx = i * _sz;
					var _ty = j * _sz;
					var _inst = instance_position(_tx, _ty, obj_EA_Wall_Parent);
					if !_inst
						{
						with (instance_create_layer(_tx, _ty, _layer, _obj))
							{
							image_speed = 0;
							sprite_index = _spr;
							_grid[# i, j] = id;
							}
						}
					else
						{
						with (_inst)
							{
							image_speed = 0;
							sprite_index = _spr;
							_grid[# i, j] = id;
							}
						}
					}
				}
			}
		// Loop through the autowall area and autowall all occupied cells
		for (var j = _areay3; j < _areay4; ++j;)
			{
			for (var i = _areax3; i < _areax4; ++i;)
				{
				with (instance_position(i * _sz, j * _sz, obj_EA_Wall_Parent))
					{
					image_index = ea_autowall_index(x, y);
					}
				}
			}
		break;
	case ea_tiles:
		// Get the tilemap for the autowall tiles
		var _tm = global.EA_Tilemap;
		// Use the DS grid functions to set the autowall grid to -4 in the circular area defined
		// This will then be used to decide where to set the tiles
		ds_grid_set_disk(_grid, _cellx, _celly, rad, -4);
		// Loop through the area the circle occupies and set tiles as required
		for (var j = _areay1; j < _areay2; ++j;)
			{
			for (var i = _areax1; i < _areax2; ++i;)
				{
				if _grid[# i, j] == -4
					{
					tilemap_set(_tm, 1, i, j);
					}
				}
			}
		// Loop through the autowall area and autowall all occupied cells
		for (var j = _areay3; j < _areay4; ++j;)
			{
			for (var i = _areax3; i < _areax4; ++i;)
				{
				var _tl = tilemap_get(_tm, i, j);
				if _tl != 0
					{
					var _tl = ea_autowall_index((i * _sz), (j * _sz));
					tilemap_set(_tm, _tl, i, j);
					_grid[# i, j] = _tl;
					}
				}
			}
		break;
	}
}


/// @function				ea_add_rect(_x, _y, width, height, [obj]);
///	@param	{real}	_x		The X position to add the autowall instance/tile to
///	@param	{real}	_y		The y position to add the autowall instance/tile to
///	@param	{real}	width	The width of the rectangle to set in CELLS
///	@param	{real}	height	The height of the rectangle to set in CELLS
///	@param	{int}	obj		OPTIONAL! The object to use for instance-based autowalls

/// @description	This function can be used to add instances or tiles to a rectangular area around
///					the nearest cell position to the X/Y position selected, autowalling the
///					surrounding occupied cells. You give the X/Y position to add the autowalls
///					to as well as the width and height of the area to autowall. By default, when 
///					using instances for autowall, the instance created will be of the object 
///					"obj_EA_Wall_Parent", but you can supply another object type to use if 
///					required, however this MUST be a child of the object "obj_EA_Wall_Parent",
///					otherwise the scripts won't work.

function ea_add_rect(_x, _y, width, height)
{
// Initialise variables
var _sz = global.EA_Size;
var _grid = global.EA_Grid;
var _cellx = (_x div _sz);
var _celly = (_y div _sz);
var _rw = (room_width div _sz);
var _rh = (room_height div _sz)

// Check for custom autowall object
var _obj = obj_EA_Wall_Parent;
if argument_count > 4
	{
	var _obj = argument[4];
	}

	// Get the area that the rectangle will occupy
	var _areaw = floor(width);
	var _areah = floor(height);
	// Modify the center cell position based on the size of the rectangle
	if _areaw div 2 == 0 && _areaw != 1 _cellx += 1;
	if _areah div 2 == 0 && _areah != 1 _celly += 1;
	// Calculate offsets for clamping the area
	var _w1 = floor(_areaw / 2);
	var _h1 = floor(_areah / 2);
	var _w2 = _areaw - _w1;
	var _h2 = _areah - _h1;
	// Calculate the top left corner of the area of the rectangle, clamped to the room width/height
	var _areax1 = clamp(_cellx - _w1, 0, _rw - 1);
	var _areay1 = clamp(_celly - _h1, 0, _rh - 1);
	// Calculate the bottom right corner of the area of the rectangle, clamped to the room width/height
	var _areax2 = clamp(_cellx + _w2 - 1, 0, _rw - 1);
	var _areay2 = clamp(_celly + _h2 - 1, 0, _rh - 1);
	// Calculate the top left corner of the area to autowall, clamped to the room width/height
	var _areax3 = clamp(_areax1 - 1, 0, _rw);
	var _areay3 = clamp(_areay1 - 1, 0, _rh);
	// Calculate the bottom right corner of the area to autowall, clamped to the room width/height
	var _areax4 = clamp(_areax2 + 2, 0, _rw);
	var _areay4 = clamp(_areay2 + 2, 0, _rh);
	// Check which "type" of autowall is being used
	switch(global.EA_Type)
	{
	case ea_instances:
		var _spr = global.EA_Image;
		var _layer = global.EA_Layer;
		// Use the DS grid functions to set the autowall grid to -4 in the rectangular area defined
		// This will then be used to decide where to create instances
		ds_grid_set_region(_grid, _areax1, _areay1, _areax2, _areay2, -4);
		// Loop through the area the rectangle occupies and create instances as required
		for (var j = _areay3; j < _areay4; ++j;)
			{
			for (var i = _areax3; i < _areax4; ++i;)
				{
				if _grid[# i, j] == -4
					{
					var _tx = i * _sz;
					var _ty = j * _sz;
					var _inst = instance_position(_tx, _ty, obj_EA_Wall_Parent);
					if !_inst
						{
						with (instance_create_layer(_tx, _ty, _layer, _obj))
							{
							image_speed = 0;
							sprite_index = _spr;
							_grid[# i, j] = id;
							}
						}
					else
						{
						with (_inst)
							{
							image_speed = 0;
							sprite_index = _spr;
							_grid[# i, j] = id;
							}
						}
					}
				}
			}
		// Loop through the autowall area and autowall all occupied cells
		for (var j = _areay3; j < _areay4; ++j;)
			{
			for (var i = _areax3; i < _areax4; ++i;)
				{
				with (instance_position(i * _sz, j * _sz, obj_EA_Wall_Parent))
					{
					image_index = ea_autowall_index(x, y);
					}
				}
			}
		break;
	case ea_tiles:
		// Get the tilemap for the autowall tiles
		var _tm = global.EA_Tilemap;
		// Use the DS grid functions to set the autowall grid to -4 in the rectangular area defined
		// This will then be used to decide where to set the tiles
		ds_grid_set_region(_grid, _areax1, _areay1, _areax2, _areay2, -4);
		// Loop through the area the rectangle occupies and set tiles as required
		for (var j = _areay3; j < _areay4; ++j;)
			{
			for (var i = _areax3; i < _areax4; ++i;)
				{
				if _grid[# i, j] == -4
					{
					tilemap_set(_tm, 1, i, j);
					}
				}
			}
		// Loop through the autowall area and autowall all occupied cells
		for (var j = _areay3; j < _areay4; ++j;)
			{
			for (var i = _areax3; i < _areax4; ++i;)
				{
				var _tl = tilemap_get(_tm, i, j);
				if _tl != 0
					{
					var _tl = ea_autowall_index((i * _sz), (j * _sz));
					tilemap_set(_tm, _tl, i, j);
					_grid[# i, j] = _tl;
					}
				}
			}
		break;
	}
}


/// @function			ea_remove_single(x, y);
///	@param	{real}	x	The X position to delete the autowall instance/tile from
///	@param	{real}	y	The y position to delete the autowall instance/tile from

/// @description	This function can be used to remove an instance or a tile from the autowall
///					layer. It will adapt all the surrounding autowall instances/tiles to 
///					correctly adapt to the space created.

function ea_remove_single(_x, _y)
{
// Initialise vars
var _sz = global.EA_Size;
var _grid = global.EA_Grid;
var _cellx = (_x div _sz);
var _celly = (_y div _sz);
var _cx = _cellx * _sz;
var _cy = _celly * _sz;
var _rw = (room_width div _sz);
var _rh = (room_height div _sz)

// Check if given position is within the room bounds
if _cellx < 0 || _cellx > _rw - 1 || _celly < 0 || _celly > _rh - 1
	{
	ea_log("ea_remove_single - ERROR! Cell position outside of autowall bounds.");
	}
else
	{
	// Remove an instance or a tile to the given position cell based on the current autowall "type"
	switch(global.EA_Type)
		{
		case ea_instances:
			// Check and see if an instance occupies the cell
			var _inst = instance_position(_cx, _cy, obj_EA_Wall_Parent);
			if instance_exists(_inst)
				{
				// Destroy the instance
				instance_destroy(_inst);
				// Reset the autowall DS grid
				_grid[# _cellx, _celly] = 0;
				var _tx = _cx - _sz;
				var _ty = _cy - _sz;
				// Loop through the area around the cell and set autwalls
				for (var j = 0; j < 3; ++j;)
					{
					for (var i = 0; i < 3; ++i;)
						{
						with (instance_position(_tx + (i * _sz), _ty + (j * _sz), obj_EA_Wall_Parent))
							{
							image_index = ea_autowall_index(x, y);
							}
						}
					}
				}
			break;
		case ea_tiles:
			// Get the tilemap
			var _tm = global.EA_Tilemap;
			var _tx = _cx - _sz;
			var _ty = _cy - _sz;
			// Set the tilemap at the removed cell position
			tilemap_set(_tm, 0, _cellx, _celly);
			// Reset the autowall DS grid
			_grid[# _cellx, _celly] = 0;
			// Loop through the area around the cell and set autwalls
			for (var j = 0; j < 3; ++j;)
				{
				for (var i = 0; i < 3; ++i;)
					{
					var _tl = tilemap_get(_tm, _cellx - 1 + i, _celly - 1 + j);
					if _tl != 0
						{
						var _tl = ea_autowall_index(_tx + (i * _sz), _ty + (j * _sz));
						tilemap_set(_tm, _tl, _cellx - 1 + i, _celly - 1 + j);
						}
					}
				}
			break;
		}
	}
}


/// @function				ea_remove_circle(_x, _y, rad);
///	@param	{real}	_x		The X position to remove the autowall instance/tile from
///	@param	{real}	_y		The y position to remove the autowall instance/tile from
///	@param	{real}	rad		The radius of the circle to remove in CELLS (minimum 1)

/// @description	This function can be used to remove instances or tiles from a circular area around
///					the nearest cell position to the X/Y position selected, autowalling the
///					surrounding occupied cells. You give the X/Y position to add the autowalls
///					to as well as the radius of the circle in autowall cells.

function ea_remove_circle(_x, _y, rad)
{
// Initialise variables
var _sz = global.EA_Size;
var _grid = global.EA_Grid;
var _rw = (room_width div _sz);
var _rh = (room_height div _sz)
if rad < 1 rad = 1;

// Get the center cell position, clamped to the room width/height
var _cellx = clamp((_x div _sz), -rad, _rw + rad - 1);
var _celly = clamp((_y div _sz), -rad, _rh + rad - 1);
// Get the total area that the circle will occupy
var _areaw = (rad * 2) + 1
var _areah = _areaw;
// Calculate the offsets from the circle origin
var _w1 = floor(_areaw / 2);
var _h1 = floor(_areah / 2);
var _w2 = _areaw - _w1;
var _h2 = _areah - _h1;
// Calculate the top left corner of the area of the circle, clamped to the room width/height
var _areax1 = clamp(_cellx - _w1, 0, _rw - 1);
var _areay1 = clamp(_celly - _h1, 0, _rh - 1);
// Calculate the bottom right corner of the area of the circle, clamped to the room width/height
var _areax2 = clamp(_cellx + _w2 - 1, 0, _rw);
var _areay2 = clamp(_celly + _h2 - 1, 0, _rh);
// Calculate the top left corner of the area to autowall, clamped to the room width/height
var _areax3 = clamp(_areax1 - 1, 0, _rw);
var _areay3 = clamp(_areay1 - 1, 0, _rh);
// Calculate the bottom right corner of the area to autowall, clamped to the room width/height
var _areax4 = clamp(_areax2 + 2, 0, _rw);
var _areay4 = clamp(_areay2 + 2, 0, _rh);
// Check which "type" of autowall is being used
switch(global.EA_Type)
	{
	case ea_instances:
		// Use the DS grid functions to set the autowall grid to -4 in the circular area defined
		// This will then be used to decide where to remove the instances from
		ds_grid_set_disk(_grid, _cellx, _celly, rad, -4);
		// Loop through the area the circle occupies and remove instances as required
		for (var j = _areay3; j < _areay4; ++j;)
			{
			for (var i = _areax3; i < _areax4; ++i;)
				{
				if _grid[# i, j] == -4
					{
					var _tx = i * _sz;
					var _ty = j * _sz;
					with (instance_position(_tx, _ty, obj_EA_Wall_Parent))
						{
						instance_destroy();
						}
					_grid[# i, j] = 0;
					}
				}
			}
		// Loop through the autowall area and autowall all remaining occupied cells
		for (var j = _areay3; j < _areay4; ++j;)
			{
			for (var i = _areax3; i < _areax4; ++i;)
				{
				with (instance_position(i * _sz, j * _sz, obj_EA_Wall_Parent))
					{
					image_index = ea_autowall_index(x, y);
					}
				}
			}
		break;
	case ea_tiles:
		// Get the tilemap for the autowall tiles
		var _tm = global.EA_Tilemap;
		// Use the DS grid functions to set the autowall grid to 0 in the circular area defined
		ds_grid_set_disk(_grid, _cellx, _celly, rad, 0);
		// Loop through the area the circle occupies and set tiles as required
		for (var j = _areay3; j < _areay4; ++j;)
			{
			for (var i = _areax3; i < _areax4; ++i;)
				{
				if _grid[# i, j] != 0
					{
					var _tl = ea_autowall_index((i * _sz), (j * _sz));
					tilemap_set(_tm, _tl, i, j);
					_grid[# i, j] = _tl;
					}
				else tilemap_set(_tm, 0, i, j);
				}
			}
		break;
	}
}


/// @function				ea_remove_rect(_x, _y, width, height, [obj]);
///	@param	{real}	_x		The X position to add the autowall instance/tile to
///	@param	{real}	_y		The y position to add the autowall instance/tile to
///	@param	{real}	width	The width of the rectangle to set in CELLS
///	@param	{real}	height	The height of the rectangle to set in CELLS
///	@param	{int}	obj		OPTIONAL! The object to use for instance-based autowalls

/// @description	This function can be used to remove instances or tiles from a rectangular area around
///					the nearest cell position to the X/Y position selected, autowalling the
///					surrounding occupied cells. You give the X/Y position to add the autowalls
///					to as well as the width and height of the area to remove.

function ea_remove_rect(_x, _y, width, height)
{
// Initialise variables
var _sz = global.EA_Size;
var _grid = global.EA_Grid;
var _cellx = (_x div _sz);
var _celly = (_y div _sz);
var _rw = (room_width div _sz);
var _rh = (room_height div _sz)

// Get the area that the rectangle will occupy
var _areaw = floor(width);
var _areah = floor(height);
// Modify the center cell position based on the size of the rectangle
if _areaw div 2 == 0 && _areaw != 1 _cellx += 1;
if _areah div 2 == 0 && _areah != 1 _celly += 1;
// Calculate offsets for clamping the area
var _w1 = floor(_areaw / 2);
var _h1 = floor(_areah / 2);
var _w2 = _areaw - _w1;
var _h2 = _areah - _h1;
// Calculate the top left corner of the area of the rectangle, clamped to the room width/height
var _areax1 = clamp(_cellx - _w1, 0, _rw - 1);
var _areay1 = clamp(_celly - _h1, 0, _rh - 1);
// Calculate the bottom right corner of the area of the rectangle, clamped to the room width/height
var _areax2 = clamp(_cellx + _w2 - 1, 0, _rw - 1);
var _areay2 = clamp(_celly + _h2 - 1, 0, _rh - 1);
// Calculate the top left corner of the area to autowall, clamped to the room width/height
var _areax3 = clamp(_areax1 - 1, 0, _rw);
var _areay3 = clamp(_areay1 - 1, 0, _rh);
// Calculate the bottom right corner of the area to autowall, clamped to the room width/height
var _areax4 = clamp(_areax2 + 2, 0, _rw);
var _areay4 = clamp(_areay2 + 2, 0, _rh);
// Check which "type" of autowall is being used
switch(global.EA_Type)
	{
	case ea_instances:
		// Use the DS grid functions to set the autowall grid to -4 in the rectangular area defined
		// This will then be used to decide where to remove instances
		ds_grid_set_region(_grid, _areax1, _areay1, _areax2, _areay2, -4);
		// Loop through the area the rectangle occupies and remove instances as required
		for (var j = _areay3; j < _areay4; ++j;)
			{
			for (var i = _areax3; i < _areax4; ++i;)
				{
				if _grid[# i, j] == -4
					{
					var _tx = i * _sz;
					var _ty = j * _sz;
					var _inst = instance_position(_tx, _ty, obj_EA_Wall_Parent);
					if _inst
						{
						with (_inst)
							{
							instance_destroy();
							}
						}
					_grid[# i, j] = 0;
					}
				}
			}
		// Loop through the autowall area and autowall all occupied cells after the removal
		for (var j = _areay3; j < _areay4; ++j;)
			{
			for (var i = _areax3; i < _areax4; ++i;)
				{
				with (instance_position(i * _sz, j * _sz, obj_EA_Wall_Parent))
					{
					image_index = ea_autowall_index(x, y);
					}
				}
			}
		break;
	case ea_tiles:
		// Get the tilemap for the autowall tiles
		var _tm = global.EA_Tilemap;
		// Use the DS grid functions to set the autowall grid to 0 in the rectangular area defined
		ds_grid_set_region(_grid, _areax1, _areay1, _areax2, _areay2, 0);
		// Loop through the area the rectangle occupies and set tiles as required
		for (var j = _areay3; j < _areay4; ++j;)
			{
			for (var i = _areax3; i < _areax4; ++i;)
				{
				if _grid[# i, j] != 0
					{
					var _tl = ea_autowall_index((i * _sz), (j * _sz));
					tilemap_set(_tm, _tl, i, j);
					_grid[# i, j] = _tl;
					}
				else tilemap_set(_tm, 0, i, j);
				}
			}
		break;
	}
}


/// @function			ea_clear_all();

/// @description	This function can be used to clear all autowall tiles or instances
///					from the current room.
	
function ea_clear_all()
{
// Check autowall "type" and remove the instances or reset the tiles as required
switch(global.EA_Type)
	{
	case ea_instances:
		with (obj_EA_Wall_Parent)
			{
			instance_destroy();
			}
		break;
	case ea_tiles:
		if layer_tilemap_exists(global.EA_Layer, global.EA_Tilemap)
			{
			layer_tilemap_destroy(global.EA_Tilemap);
			}
		global.EA_Tilemap = layer_tilemap_create(global.EA_Layer, 0, 0, global.EA_Image, global.EA_Size, global.EA_Size);
		break;
	}

// Reset the autowall DS Grid
var _gw = room_width div global.EA_Size;
var _gh = room_height div global.EA_Size;
if ds_exists(global.EA_Grid, ds_type_grid)
	{
	ds_grid_destroy(global.EA_Grid);
	}
global.EA_Grid = ds_grid_create(_gw, _gh);
ds_grid_clear(global.EA_Grid, 0);

ea_log("ea_clear_all() - Autowall sprites/tiles cleared.");
return true;
}




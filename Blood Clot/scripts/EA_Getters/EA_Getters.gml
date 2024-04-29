/// The following functions can be used to get information about the autowall engine:
///
///		ea_get_mode()
///		ea_get_type()
///		ea_get_image()
///		ea_get_layer();
///		ea_get_tilemap()
///		ea_get_size()
///		ea_get_grid()
///		ea_get_debug()
///		


/// @function		ea_get_mode();
/// @description	This function will get the current autowall mode, returning either
///					16 or 47 depending on the mode selected
function ea_get_mode()
{
return global.EA_Mode;
}


/// @function		ea_get_type();
/// @description	This function will get the current autowall type, returning either
///					ea_instances or ea_tiles depending on the type selected
function ea_get_type()
{
return global.EA_Type;
}


/// @function		ea_get_image();
/// @description	This function will get the current autowall image, returning either
///					A sprite index or a tileset index.
function ea_get_image()
{
return global.EA_Image;
}


/// @function		ea_get_layer();
/// @description	This function will get the current autowall layer
function ea_get_layer()
{
return global.EA_Layer;
}


/// @function		ea_get_tilemap();
/// @description	This function will get the current autowall tilemap associated
///					with the autowall tiles.
function ea_get_tilemap()
{
return global.EA_Tilemap;
}


/// @function		ea_get_size();
/// @description	This function will get the current autowall cell size
function ea_get_size()
{
return global.EA_Size;
}


/// @function		ea_get_grid();
/// @description	This function will get the current index of the DS grid being
///					used to hold the autowall data.
function ea_get_grid()
{
return global.EA_Grid;
}


/// @function		ea_get_debug();
/// @description	This function get the current debug level being used by
///					the autowall engine.
function ea_get_debug()
{
return global.EA_Debug;
}











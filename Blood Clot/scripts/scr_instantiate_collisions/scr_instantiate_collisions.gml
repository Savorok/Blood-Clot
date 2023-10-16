///@funciton scr_get_collision_area(_rect_array)
///@param {index} _rect_array

///@description This function will take an array of rectangles as represented by x1,y1,x2,y2
///				and instantiate collision objects in thier place, scaling them as needed
function scr_instantiate_collisions(_rect_array)
{
	
	for(i = 0; i < array_length(_rect_array); i++)
	{
		//show_debug_message("Rectangle " + string(_rect_array[i]));
	
		var _temp = _rect_array[i];
		var _x1 = _temp[0];
		var _y1 = _temp[1];
		var _x2 = _temp[2];
		var _y2 = _temp[3];
	
		//add one due to 0 indexing of grid
		var _width = _x2-_x1 + 1;
		var _height = _y2-_y1 + 1;
		
		//show_debug_message("Width:" + string(_width) + " Height:" + string(_height));
	
		var _inst = instance_create_layer(_x1*16,_y1*16,"Collision",obj_solid)
		_inst.image_xscale = _width;
		_inst.image_yscale = _height;

	}
}
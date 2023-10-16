///@funciton scr_generate_collision_areas(collision_areas)
///@param {index} collision_areas

///@description This function will take a ds_grid containing 1's and 0's and attempt to fill the area of 1's
///				with rectangles until all the collidable space has a rectangle covering it 

function scr_generate_collision_areas(collision_areas)
{
	//width and height of the tilemap
	var _width = ds_grid_width(collision_areas);
	var _height = ds_grid_height(collision_areas);
	
	//ds_grid to keep track of the rectnagles
	var rectangle_grid = ds_grid_create(_width,_height);
	//make the new grid equall to the 
	ds_grid_copy(rectangle_grid,collision_areas);
	
	//the current number of rectangle we are on (start from 2 as 1 is our collision area)
	var _rectangle_num = 1;
	
	//array of the rectangles
	var rectangle_array = [[]];
	
	//check if there is still collidable area in the grid
	while(getStartingCoOrd(_width,_height,rectangle_grid) != false)
	{	
		//show_debug_message("////////NEW RECTANGLE////////// NUM:" + string(_rectangle_num));
		
		var temp = getStartingCoOrd(_width,_height,rectangle_grid);
		var _x = temp[0];
		var _y = temp[1];
		
		//show_debug_message("Starting coord:" + string(_x) + " " + string(_y));
		
		var rect_bottom_corner = makeRectangle(_x,_y,rectangle_grid);
		var _x2 = rect_bottom_corner[0]
		var _y2 = rect_bottom_corner[1]
		
		//show_debug_message("rect co-ords:" + string(_x) + "," + string(_y) + "," + string(_x2) + "," + string(_y2));
		
		ds_grid_set_region(rectangle_grid,_x,_y,_x2,_y2,_rectangle_num);
		
		var rect = [];
		rect[0] = _x;
		rect[1] = _y;
		rect[2] = _x2;
		rect[3] = _y2;
		
		rectangle_array[_rectangle_num-1] = rect;
		
		_rectangle_num++;
	}
	
	
	#region // Used to make Textfile to check the rectangles 
			
	show_debug_message("Finished Getting cols")
		
	var file_name = "rectangleArray.csv"
	
	//create file to save array
	var file = file_text_open_write(file_name)
	
	//show_debug_message(tilemap_array);
	
	scr_ds_grid_to_file(file_name,rectangle_grid);	
	
	#endregion
	
	//return the rectangle array
	return rectangle_array;
	

	
}

//get the first -1 in the grid from top left to bottom right
function getStartingCoOrd(_width,_height,_grid)
{
	for(var j = 0; j<_height; j++)
	{
		for(var i = 0; i<_width; i++)
		{
			if(ds_grid_get(_grid,i,j) == -1)
			{		
				_x = i;
				_y = j;
			
				return [i,j];
			}
		}
	}	
	return false;
}

//given the top left point try and make as big a rectangle to fill the space as possible
function makeRectangle(_x1, _y1, _grid)
{
	var _cur_rect_width = 1;
	var _cur_rect_height = 1;
	
	var _canExpandRight = true;
	var _canExpandDown = true;
	
	var _finished = false;
	
	while(!_finished)
	{
		//if you can no longer expand we are done making the rectangle
		if(!_canExpandRight && !_canExpandDown)
		{
			_finished = true;	
		}

		if(_canExpandRight)
		{	
			//check to see if you can expand to the right for each cell in height
			for(h = 0; h < _cur_rect_height; h++)
			{
				if(checkRight(_x1,h+_y1,_cur_rect_width-1,_grid) == false)
				{
					_canExpandRight = false;
					break;
				}
			}
			
			if(_canExpandRight)
			{
				//we can expand right so increase the width
				//show_debug_message("Added width");
				_cur_rect_width++;
			}
		}
		
		if(_canExpandDown)
		{
		
			//check to see if you can expand down for each cell in width
			for(w = 0; w < _cur_rect_width; w++)
			{
				if(checkDown(w+_x1,_y1,_cur_rect_height-1,_grid) == false)
				{
					_canExpandDown = false;
					break;
				}
			}
			
			if(_canExpandDown)
			{
				//we can expand right so increase the width
				//show_debug_message("Added height");
				_cur_rect_height++;
			}
		}
	}
	
	//we have made the rectangle so return its co-ordinates
	var _x2 = _x1 + _cur_rect_width -1;
	var _y2 = _y1 + _cur_rect_height -1;
	
	return [_x2,_y2]
	
}

//given a starting X and Y position check to the right of it to see if its a collision area
//Takes in the width of the current rectangle to offset searching positions 
function checkRight(_x, _y, _width, _grid)
{
	//show_debug_message("Checking Right:" + string(_x+1) + "," +string(_y));
	//make sure check isnt out of bounds of grid
	if(_x+1+_width < ds_grid_width(_grid))
	{
		if(ds_grid_get(_grid,_x+1+_width,_y) == -1)
		{
			return true;
		}
		else
		{
			//show_debug_message("Cant go right");
			return false;	
		}
	}
	else
	{
		return false;	
	}
	
}

//given a starting X and Y position check to the bottom to see if its a collision area
//takes in the height of the current rectangle to offset searching position
function checkDown(_x, _y, _height, _grid)
{
	//show_debug_message("Checking Down:" + string(_x) + "," +string(_y+1));
	if(_y+1+_height < ds_grid_height(_grid))
	{
		if(ds_grid_get(_grid,_x,_y+1+_height) == -1)
		{
			return true;
		}
		else
		{
			//show_debug_message("Cant go down");
			return false;	
		}
	}
	else
	{
		return false;	
	}
}




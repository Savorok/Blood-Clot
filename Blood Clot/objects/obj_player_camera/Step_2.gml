var cur_camera_width = camera_get_view_width(view_camera[0]);
var cur_camera_height = camera_get_view_height(view_camera[0]);
var new_camera_width = cur_camera_width;
var new_camera_height = cur_camera_height;
var camera_x = camera_get_view_x(view_camera[0]);
var camera_y = camera_get_view_y(view_camera[0]);

if(follow != noone)
{
	if(instance_exists(follow))
	{
		if(!Camera_Controller.zoom)
		{
			//move x and y towards player
			x += (x_to-x)/pan_speed;
			y += (y_to-y)/pan_speed;

			if(follow != noone)
			{
				x_to = follow.x-Camera_Controller.view_width/2;
				y_to = follow.y-Camera_Controller.view_height/2;
			}
	
			//stop when zoomed out
			if(cur_camera_width > view_width and cur_camera_height > view_height)
			{
				x = camera_x;
				y = camera_y;
				new_camera_width = view_width;
				new_camera_height = view_height;		
			}	
			//return from zoom	
			if(cur_camera_width < view_width and cur_camera_height < view_height)
			{
				x = camera_x - zoom_w/return_time;
				y = camera_y - zoom_h/return_time;
				new_camera_width = cur_camera_width + zoom_w;
				new_camera_height = cur_camera_height + zoom_h;
			}	
		}

		if(Camera_Controller.zoom)
		{
			//stop when zoomed in
			if(cur_camera_width <= max_zoom_width or cur_camera_height <= max_zoom_height)
			{
				x = camera_x;
				y = camera_y;
				new_camera_width = view_width/5;
				new_camera_height = view_height/5
			}
			//zoom in
			else
			{
				x = camera_x + zoom_w;
				y = camera_y + zoom_h;
				new_camera_width = cur_camera_width - zoom_w;
				new_camera_height = cur_camera_height- zoom_h
			}
		}

		if(Camera_Controller.shaking)
		{
			x = camera_x - random_range(-shake_amount,shake_amount);
			y = camera_y + random_range(-shake_amount,shake_amount);
		}

		//set camera position and size
		camera_set_view_pos(view_camera[0],x,y);
		camera_set_view_size(view_camera[0],new_camera_width, new_camera_height);

	}
}




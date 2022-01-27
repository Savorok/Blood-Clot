function scr_player_camera()
{
	cur_camera_width = camera_get_view_width(view_camera[0]);
	cur_camera_height = camera_get_view_height(view_camera[0]);
	camera_x = camera_get_view_x(view_camera[0]);
	camera_y = camera_get_view_y(view_camera[0]);

	camera_set_view_size(view_camera[0],view_width,view_height);
	
	camera_set_view_target(view_camera[0],obj_player);
	camera_set_view_speed(view_camera[0],h_view_speed,v_view_speed);
	camera_set_view_border(view_camera[0],h_camera_border,v_camera_border);
	
	if(zoom)
	{
		//zoom the camera
		camera_set_view_size(view_camera[0],cur_camera_width - zoom_w, cur_camera_height- zoom_h);
		if(cur_camera_width <= max_zoom_width or cur_camera_height <= max_zoom_height)
		{
			camera_set_view_size(view_camera[0],view_width/5,view_height/5);
		}
	}
	else if(shaking)
	{
		camera_set_view_pos(view_camera[0],camera_x - random_range(-shake_amount,shake_amount),camera_y + random_range(-shake_amount,shake_amount));
	}
	else
	{
		//return from zoom	
		if(cur_camera_width < view_width and cur_camera_height < view_height)
		{
			camera_set_view_size(view_camera[0], cur_camera_width + zoom_w/return_time, cur_camera_height + zoom_h/return_time);	
			//camera_set_view_pos(view_camera[0],camera_x -zoom/return_time, camera_y - zoom/return_time);
			
			show_debug_message("Width:" + string(cur_camera_width) + " || " + "Height:" + string(cur_camera_height));
			
			
			
		}
		else if(cur_camera_width >= view_width and cur_camera_height >= view_height)
		{
			camera_set_view_size(view_camera[0],view_width, view_height);			
		}	
	}
}




/// @description Draw Debug

if(debug)
{
	var xx = view_get_xport(view_camera[0]);
	var yy = view_get_yport(view_camera[0]);
	
	//draw debug box
	draw_set_color(c_white);
	draw_rectangle(xx+16,yy+16,xx+300,yy+400,false);//main box
	draw_set_color(c_black);
	draw_rectangle(xx+16,yy+16,xx+300,yy+400,true);//border
	
	#region Create an array of all debug info
		
	debug_info[0][0] = "fps:";
	debug_info[0][1] = string(fps);
	
	debug_info[1][0] = "Real fps:";
	debug_info[1][1] = string(fps_real);
	
	debug_info[2][0] = "Instance count:";
	debug_info[2][1] = string(instance_count);
	
	debug_info[3][0] = "Paused:";
	debug_info[3][1] = string(paused);
	
	if(instance_exists(obj_player))
	{
		debug_info[4][0] = "cur_blood:";
		debug_info[4][1] = string(obj_player.cur_blood);
	
		debug_info[5][0] = "Player alpha:";
		debug_info[5][1] = string(obj_player.alpha);
		
		debug_info[6][0] = "In water?:";
		debug_info[6][1] = string(obj_player.in_water);
		
	}
	
	#endregion
	
	//draw debug info
	draw_set_color(c_black);
	draw_set_alpha(1);
	
	x_pos = xx+20;
	y_pos = yy+22;		
	
	for(var i = 0; i < array_length(debug_info); i++;)
	{
		draw_text(x_pos,y_pos,debug_info[i][0] + debug_info[i][1]);
		
		y_pos += 16;
	}
	
}
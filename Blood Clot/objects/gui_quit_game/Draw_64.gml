/// @description draw the quit dialog

//draw backround
draw_set_color(c_black);
draw_set_alpha(.5);
draw_rectangle(0,0,centre_x*2,centre_y*2,false);
	
//draw quit dialog
draw_set_alpha(1);
draw_sprite_ext(spr_quit_game,image_index,centre_x,centre_y,2*gui_scale,2*gui_scale,image_angle,image_blend,image_alpha);

//draw options
draw_sprite_ext(spr_no,0,centre_x-20*gui_scale,centre_y+(1*button_offset),gui_scale,gui_scale,image_angle,image_blend,image_alpha);
draw_sprite_ext(spr_yes,0,centre_x+30*gui_scale,centre_y+(1*button_offset),gui_scale,gui_scale,image_angle,image_blend,image_alpha);

#region //keyboard controll

	//if player is going from mouse to keybard input
	if(menu_mode == 0 and (right || left))
	{
		menu_mode = 1;
		mx = mouse_gui_x;
		my = mouse_gui_y;
		mpos = 0;
	}

	//user is using keyboard
	if(menu_mode == 1)
	{
		switch(mpos)	
		{
			//continue
			case 0:
				draw_sprite_ext(spr_no,1,centre_x-20*gui_scale,centre_y+(1*button_offset),gui_scale,gui_scale,image_angle,image_blend,image_alpha);
				break;
		
			//restart
			case 1:
				draw_sprite_ext(spr_yes,1,centre_x+30*gui_scale,centre_y+(1*button_offset),gui_scale,gui_scale,image_angle,image_blend,image_alpha);
				break;
		}
	}
	
#endregion

#region //mouse controll
	
	//if user is going from keyboard to mouse mode 
	if(menu_mode == 1)
	{
		//player is using mouse input
		var moving = point_distance(mx,my,mouse_gui_x,mouse_gui_y);
	
		if(moving)
		{
			menu_mode = 0;
			mpos = 0;
		}
	}
	
	//mouse controll
	if(menu_mode == 0)
	{
	
		//no
		if(point_in_rectangle(mouse_gui_x,mouse_gui_y,
	    centre_x-sprite_get_width(spr_no)-20*gui_scale,
		centre_y+(1*button_offset),
		centre_x-20*gui_scale,
		centre_y+(1*button_offset)+sprite_get_height(spr_no)*gui_scale,
		))
		{
			draw_sprite_ext(spr_no,1,centre_x-20*gui_scale,centre_y+(1*button_offset),gui_scale,gui_scale,image_angle,image_blend,image_alpha);
			mpos = 0;
		}
	
		//yes
		if(point_in_rectangle(mouse_gui_x,mouse_gui_y,
	    centre_x+30*gui_scale,
		centre_y+(1*button_offset),
		centre_x+30*gui_scale+sprite_get_width(spr_yes),
		centre_y+(1*button_offset)+sprite_get_height(spr_yes)*gui_scale,
		))
		{
			draw_sprite_ext(spr_yes,1,centre_x+30*gui_scale,centre_y+(1*button_offset),gui_scale,gui_scale,image_angle,image_blend,image_alpha);
			mpos = 1;
		}
	}
#endregion
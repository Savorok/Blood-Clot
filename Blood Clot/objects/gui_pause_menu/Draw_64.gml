/// @description draw pause menu

show_debug_message("Mpos:"+string(mpos))

//draw backround
draw_set_color(c_black);
draw_set_alpha(.5);
draw_rectangle(0,0,centre_x*2,centre_y*2,false);
	
//draw pause menu text
draw_set_alpha(1);
draw_sprite_ext(spr_pause_box,image_index,centre_x,centre_y,2*gui_scale,2*gui_scale,image_angle,image_blend,image_alpha)

//draw options
draw_sprite_ext(spr_pause_continue,0,centre_x,centre_y-(2*button_offset),gui_scale,gui_scale,image_angle,image_blend,image_alpha)
draw_sprite_ext(spr_pause_restart,0,centre_x,centre_y-(1*button_offset),gui_scale,gui_scale,image_angle,image_blend,image_alpha)
draw_sprite_ext(spr_pause_settings,0,centre_x,centre_y,gui_scale,gui_scale,image_angle,image_blend,image_alpha)
draw_sprite_ext(spr_pause_main_menu,0,centre_x,centre_y+(1*button_offset),gui_scale,gui_scale,image_angle,image_blend,image_alpha)
draw_sprite_ext(spr_pause_exit_game,0,centre_x,centre_y+(2*button_offset),gui_scale,gui_scale,image_angle,image_blend,image_alpha)

#region //keyboard controll

	//if player is going from mouse to keybard input
	if(menu_mode = 0 and (up || down))
	{
		menu_mode = 1;
		mx = mouse_gui_x;
		my = mouse_gui_y;
		mpos = 0;
	}

	//user is using keyboard
	if(menu_mode = 1)
	{
		switch(mpos)	
		{
			//continue
			case 0:
				draw_sprite_ext(spr_pause_continue,1,centre_x,centre_y-(2*button_offset),gui_scale,gui_scale,image_angle,image_blend,image_alpha);
				break;
		
			//restart
			case 1:
				draw_sprite_ext(spr_pause_restart,1,centre_x,centre_y-(1*button_offset),gui_scale,gui_scale,image_angle,image_blend,image_alpha);
				break;
			
			//settings
			case 2:
				draw_sprite_ext(spr_pause_settings,1,centre_x,centre_y,gui_scale,gui_scale,image_angle,image_blend,image_alpha);
				break;
		
			//main menu
			case 3:
				draw_sprite_ext(spr_pause_main_menu,1,centre_x,centre_y+(1*button_offset),gui_scale,gui_scale,image_angle,image_blend,image_alpha);
				break;
			
			//exit game
			case 4:
				draw_sprite_ext(spr_pause_exit_game,1,centre_x,centre_y+(2*button_offset),gui_scale,gui_scale,image_angle,image_blend,image_alpha);
				break;
		}
	}
	
#endregion

#region //mouse controll
	
	//if user is going from keyboard to mouse mode 
	if(menu_mode = 1)
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
	
	//continue
	if(point_in_rectangle(mouse_gui_x,mouse_gui_y,
    centre_x-sprite_get_width(spr_pause_continue)/2,
	centre_y-(2*button_offset),
	centre_x+sprite_get_width(spr_pause_continue)/2,
	centre_y-(2*button_offset)+sprite_get_height(spr_pause_continue)*gui_scale,
	))
	{
		draw_sprite_ext(spr_pause_continue,1,centre_x,centre_y-(2*button_offset),gui_scale,gui_scale,image_angle,image_blend,image_alpha);
		mpos = 0;
	}
	
	//restart
	if(point_in_rectangle(mouse_gui_x,mouse_gui_y,
    centre_x-sprite_get_width(spr_pause_restart)/2,
	centre_y-(1*button_offset),
	centre_x+sprite_get_width(spr_pause_restart)/2,
	centre_y-(1*button_offset)+sprite_get_height(spr_pause_restart)*gui_scale,
	))
	{
		draw_sprite_ext(spr_pause_restart,1,centre_x,centre_y-(1*button_offset),gui_scale,gui_scale,image_angle,image_blend,image_alpha);
		mpos = 1;
	}
	
	//settings
	if(point_in_rectangle(mouse_gui_x,mouse_gui_y,
    centre_x-sprite_get_width(spr_pause_settings)/2,
	centre_y,
	centre_x+sprite_get_width(spr_pause_settings)/2,
	centre_y+sprite_get_height(spr_pause_settings)*gui_scale,
	))
	{
		draw_sprite_ext(spr_pause_settings,1,centre_x,centre_y,gui_scale,gui_scale,image_angle,image_blend,image_alpha);
		mpos = 2;
	}
	
	//main menu
	if(point_in_rectangle(mouse_gui_x,mouse_gui_y,
    centre_x-sprite_get_width(spr_pause_main_menu)/2,
	centre_y+(1*button_offset),
	centre_x+sprite_get_width(spr_pause_main_menu)/2,
	centre_y+(1*button_offset)+sprite_get_height(spr_pause_main_menu)*gui_scale,
	))
	{
		draw_sprite_ext(spr_pause_main_menu,1,centre_x,centre_y+(1*button_offset),gui_scale,gui_scale,image_angle,image_blend,image_alpha);
		mpos = 3;
	}
	
	//exit game
	if(point_in_rectangle(mouse_gui_x,mouse_gui_y,
    centre_x-sprite_get_width(spr_pause_exit_game)/2,
	centre_y+(2*button_offset),
	centre_x+sprite_get_width(spr_pause_exit_game)/2,
	centre_y+(2*button_offset)+sprite_get_height(spr_pause_exit_game)*gui_scale,
	))
	{	
		draw_sprite_ext(spr_pause_exit_game,1,centre_x,centre_y+(2*button_offset),gui_scale,gui_scale,image_angle,image_blend,image_alpha);
		mpos = 4;
	}
	
	
	
#endregion

//draw version number
draw_set_color(c_gray);
draw_set_font(fnt_gui_10);
draw_set_halign(fa_center);
draw_text(centre_x,centre_y+(3.5*button_offset),"Ver: " + string(Global_Controller.version));
draw_set_halign(fa_left);


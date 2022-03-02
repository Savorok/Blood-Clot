/// @description 

#region close if needed

if(!instance_exists(imgui)){exit;}
if(!imguigml_ready()){exit;}

#endregion

//activate the initial window 
imguigml_set_next_window_size(menu_width, menu_height, EImGui_Cond.Once);
var spawn_window = imguigml_begin("Spawn Window",true);
	
//set window scale and display mode
imguigml_set_display_mode(EImGui_DisplayMode.GUIAspect)
imguigml_set_display_scale(scale,scale);

if(spawn_window[0])
{
	#region grid and debug masks

	imguigml_text("Show Debug Masks:");
	imguigml_push_item_width(32);
	imguigml_pop_item_width();
	imguigml_same_line(); 
	var ckbox_show_debug_masks = imguigml_checkbox("", show_debug_masks);
	if(ckbox_show_debug_masks[0])
	{			
		show_debug_masks = ckbox_show_debug_masks[1];
		Imgui_dev_menu.show_debug_masks = ckbox_show_debug_masks[1];
	}
	//draw grid
	imguigml_same_line();
	imguigml_text("Draw Grid:");
	imguigml_same_line();
	var chk_grid = imguigml_checkbox("##grid", draw_grid)
	if(chk_grid[0])
	{
		draw_grid = chk_grid[1];
	}
	//grid colour
	imguigml_text("Grid colour:");
	imguigml_same_line();
	var _colour = imguigml_color_convert_u32_to_float4(imguigml_color_convert_gml_to_u32(grid_colour,grid_alpha));
	var grid_colour_picker = imguigml_color_edit4("##grid_colour", _colour[0],_colour[1],_colour[2],_colour[3]);
	if(grid_colour_picker[0])
	{
		var _colour;
		_colour = imguigml_color_convert_u32_to_gml(imguigml_color_convert_float4_to_u32(grid_colour_picker[1], grid_colour_picker[2], grid_colour_picker[3], grid_colour_picker[4]));
		grid_colour = _colour[0];
		grid_alpha = _colour[1];
	}
	
	
	
	imguigml_separator();
	
	#endregion
		
	but_col_pos = 0;	
	
	ColourButton(button_colours[but_col_pos],c_red,"Delete");
	if(button_colours[but_col_pos] == 0)
	{
		var delete_button = imguigml_button("Delete");
		if(delete_button)
		{ 
			delete_mode = true; 
			cur_spawn = "None";
			cur_particle = "None";
			button_colours = array_create(arr_size,0);
			button_colours[but_col_pos] = 1;
		}
	}
	

	var bonus_tab = imguigml_collapsing_header("Particles")
	if(bonus_tab[0])
	{			
		but_col_pos++;
		ColourButton(button_colours[but_col_pos],active_button_colour,"Light Blood");
		if(button_colours[but_col_pos] == 0)
		{
			var blood = imguigml_button("Light Blood");
			if(blood)
			{ 
				cur_particle = "Light Blood"; 
				button_colours = array_create(arr_size,0);
				button_colours[but_col_pos] = 1;
			}
		}
		imguigml_same_line();
		but_col_pos++;
		ColourButton(button_colours[but_col_pos],active_button_colour,"Heavy Blood");
		if(button_colours[but_col_pos] == 0)
		{
			var heavy_blood = imguigml_button("Heavy Blood");
			if(heavy_blood)
			{ 
				cur_particle = "Heavy Blood"
				button_colours = array_create(arr_size,0);
				button_colours[but_col_pos] = 1;
			}	
		}
		imguigml_same_line();
		but_col_pos++;
		ColourButton(button_colours[but_col_pos],active_button_colour,"Fast Blood");
		if(button_colours[but_col_pos] == 0)
		{
			var fast_blood = imguigml_button("Fast Blood");
			if(fast_blood)
			{ 
				cur_particle = "Fast Blood" 
				button_colours = array_create(arr_size,0);
				button_colours[but_col_pos] = 1;
			}	
		}
		but_col_pos++;
		ColourButton(button_colours[but_col_pos],active_button_colour,"Confetti");
		if(button_colours[but_col_pos] == 0)
		{
			var confetti = imguigml_button("Confetti");
			if(confetti)
			{
				cur_particle = "Confetti";
				button_colours = array_create(arr_size,0);
				button_colours[but_col_pos] = 1;
			}
		}
		but_col_pos++;
		ColourButton(button_colours[but_col_pos],active_button_colour,"Paint");
		if(button_colours[but_col_pos] == 0)
		{
			var paint = imguigml_button("Paint");
			if(paint)
			{
				cur_particle = "Paint";
				button_colours = array_create(arr_size,0);
				button_colours[but_col_pos] = 1;
			}
		}
		imguigml_same_line();
		//paint colour
		imguigml_text("Paint colour:");
		imguigml_same_line();
		var paint_colour = imguigml_combo("##paint_colour",paint_colour_num,paint_colours);
		if(paint_colour[0])
		{
			paint_colour_num = paint_colour[1];		
			imguigml_end_combo();
		}
			
		//amount of blood
		imguigml_text("Amount of particles:")
		var amount_of_particles = imguigml_input_int("##amount_of_particles", particle_amount, 1, 10);
		if (amount_of_particles[0])
		{
			particle_amount = amount_of_particles[1];
		}
	}
	
	var bonus_tab = imguigml_collapsing_header("Bonus")
	if(bonus_tab[0])
	{		
		but_col_pos++;
		ColourButton(button_colours[but_col_pos],active_button_colour,"Blood Bag");	
		if(button_colours[but_col_pos] == 0)
		{
			var blood_bag = imguigml_button("Blood Bag");
			if(blood_bag)
			{ 
				cur_spawn = "Blood bag"; 
				button_colours = array_create(arr_size,0);
				button_colours[but_col_pos] = 1;
			}
		}
		
		but_col_pos++;
		ColourButton(button_colours[but_col_pos],active_button_colour,"Confetti Bomb");	
		if(button_colours[but_col_pos] == 0)
		{	
			var confetti_bomb = imguigml_button("Confetti Bomb");
			if(confetti_bomb)
			{ 
				cur_spawn = "Confetti bomb"; 
				button_colours = array_create(arr_size,0);
				button_colours[but_col_pos] = 1;
			}
		}
		but_col_pos++;
		ColourButton(button_colours[but_col_pos],active_button_colour,"Paint Bomb");	
		if(button_colours[but_col_pos] == 0)
		{	
			var paint_bomb = imguigml_button("Paint Bomb");
			if(paint_bomb)
			{ 
				cur_spawn = "Paint bomb";
				button_colours = array_create(arr_size,0);
				button_colours[but_col_pos] = 1;
			}
		}
		imguigml_same_line();
		//paint colour
		imguigml_text("Paint colour:");
		imguigml_same_line();
		var paint_colour = imguigml_combo("##paint_colour",paint_colour_num,paint_colours);
		if(paint_colour[0])
		{
			paint_colour_num = paint_colour[1];		
			imguigml_end_combo();
		}
		
	}
	
	var obstacles_tab = imguigml_collapsing_header("Obstacles")
	if(obstacles_tab[0])
	{
		var spikes_tab = imguigml_collapsing_header("Spikes")
		if(spikes_tab[0])
		{
			but_col_pos++;
			ColourButton(button_colours[but_col_pos],active_button_colour,"Spikes right");	
			if(button_colours[but_col_pos] == 0)
			{
				var spikes_right = imguigml_button("Spikes right");
				if(spikes_right)
				{ 
					cur_spawn = "Spikes right"; 
					button_colours = array_create(arr_size,0);
					button_colours[but_col_pos] = 1;
				}
			}
			imguigml_same_line();
			but_col_pos++;
			ColourButton(button_colours[but_col_pos],active_button_colour,"Spikes left");	
			if(button_colours[but_col_pos] == 0)
			{
				var spikes_left = imguigml_button("Spikes left");
				if(spikes_left)
				{ 
					cur_spawn = "Spikes left";
					button_colours = array_create(arr_size,0);
					button_colours[but_col_pos] = 1;
				}
			}
			imguigml_same_line();
			but_col_pos++;
			ColourButton(button_colours[but_col_pos],active_button_colour,"Spikes up");	
			if(button_colours[but_col_pos] == 0)
			{
				var spikes_up = imguigml_button("Spikes up");
				if(spikes_up)
				{ 
					cur_spawn = "Spikes up";
					button_colours = array_create(arr_size,0);
					button_colours[but_col_pos] = 1;
				}
			}
			imguigml_same_line();
			but_col_pos++;
			ColourButton(button_colours[but_col_pos],active_button_colour,"Spikes down");	
			if(button_colours[but_col_pos] == 0)
			{
				var spikes_down = imguigml_button("Spikes down");
				if(spikes_down)
				{ 
					cur_spawn = "Spikes down"; 
					button_colours = array_create(arr_size,0);
					button_colours[but_col_pos] = 1;
				}	
			}
		}
	}
	
	//close window if needed
	if(!spawn_window[1])
	{
		instance_destroy();	
	}
}

//spawn stuff
var click = mouse_check_button(mb_left);
var click_pressed = mouse_check_button_pressed(mb_left);
var click_rmb = mouse_check_button_pressed(mb_right);
//x and y grid snap
spawn_x = floor(mouse_x/16)*16;
spawn_y = floor(mouse_y/16)*16;
//reset spawn
if(click_rmb)
{
	cur_spawn = "None";
	cur_particle = "None";
	delete_mode = false;
	button_colours = array_create(arr_size,0);
}

if(click)
{
	switch(cur_particle)
	{
		case "None":
			break;
		
		case "Light Blood":
			repeat(particle_amount){instance_create_layer(mouse_x, mouse_y,"Particles",obj_light_blood);}
			break;
		
		case "Heavy Blood":	
			repeat(particle_amount){instance_create_layer(mouse_x, mouse_y,"Particles",obj_blood);}
			break;
	
		case "Fast Blood":
			repeat(particle_amount){instance_create_layer(mouse_x, mouse_y,"Particles",obj_fast_blood);}
			break;
	
		case "Confetti":
			repeat(particle_amount){instance_create_layer(mouse_x, mouse_y,"Particles",obj_confetti);}
			break;
		
		case "Paint":
			repeat(particle_amount)
			{
				var paint = instance_create_layer(mouse_x, mouse_y,"Particles",obj_paint);
				paint.image_index = paint_colour_num;
				paint.image_speed = 0;
			}
			break;
	}
}
if(click_pressed)
{
	if(delete_mode)
	{
		var instance = instance_position(mouse_x,mouse_y,all)
		instance_destroy(instance);
	}
	
	
	switch(cur_spawn)
	{
		case "None":
			break;
	
		#region bonus
	
		case "Blood bag":
			instance_create_layer(spawn_x,spawn_y,"Instances",obj_blood_bag);	
			break;
		
		case "Confetti bomb":
			instance_create_layer(spawn_x,spawn_y,"Instances",obj_paint_bomb);					
			break;
	
		case "Paint bomb":		
			var paint_bomb = instance_create_layer(spawn_x,spawn_y,"Instances",obj_paint_bomb_single);	
			paint_bomb.colour = paint_colour_num;
			paint_bomb.image_index = paint_colour_num;
			paint_bomb.image_speed = 0;
			break;
		
		#endregion
	
		#region obstacles
	
		case "Spikes right":
			instance_create_layer(spawn_x,spawn_y,"Instances",obj_spikes_right);
			break;
			
		case "Spikes left":
			instance_create_layer(spawn_x,spawn_y,"Instances",obj_spikes_left);
			break;
			
		case "Spikes up":
		instance_create_layer(spawn_x,spawn_y,"Instances",obj_spikes_up);
		break;
		
		case "Spikes down":
		instance_create_layer(spawn_x,spawn_y,"Instances",obj_spikes_down);
		break;
	
		#endregion
	}
}


imguigml_end();
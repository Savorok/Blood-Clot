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
	#region grid
	
	//draw grid
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
	
	var bonus_tab = imguigml_collapsing_header("Particles")
	if(bonus_tab[0])
	{
		imguigml_text("Cur Particles:" + cur_particle);
		
		var none = imguigml_button("None");
		if(none){ cur_particle = "None"}
	
		var blood = imguigml_button("Light Blood");
		if(blood){ cur_particle = "Light Blood" }
		imguigml_same_line();
		var heavy_blood = imguigml_button("Heavy Blood");
		if(heavy_blood){ cur_particle = "Heavy Blood" }	
		imguigml_same_line();
		var fast_blood = imguigml_button("Fast Blood");
		if(fast_blood){ cur_particle = "Fast Blood" }	
		
		var confetti = imguigml_button("Confetti");
		if(confetti){cur_particle = "Confetti";}
		
		var paint = imguigml_button("Paint");
		if(paint){cur_particle = "Paint";}
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
		
	}
	
	
	//close window if needed
	if(!spawn_window[1])
	{
		instance_destroy();	
	}
}

//create blood
var click = mouse_check_button(mb_left);
switch(cur_particle)
{
	case "None":
		break;
		
	case "Light Blood":
		if(click)
		{
			repeat(particle_amount){instance_create_layer(mouse_x, mouse_y,"Particles",obj_light_blood);}
		}
		break;
		
	case "Heavy Blood":
	if(click)
		{
			repeat(particle_amount){instance_create_layer(mouse_x, mouse_y,"Particles",obj_blood);}
		}
		break;
	
	case "Fast Blood":
	if(click)
		{
			repeat(particle_amount){instance_create_layer(mouse_x, mouse_y,"Particles",obj_fast_blood);}
		}
		break;
	
	case "Confetti":
	if(click)
		{
			repeat(particle_amount){instance_create_layer(mouse_x, mouse_y,"Particles",obj_confetti);}
		}
		break;
		
	case "Paint":
	if(click)
		{
			repeat(particle_amount)
			{
				var paint = instance_create_layer(mouse_x, mouse_y,"Particles",obj_paint);
				paint.image_index = paint_colour_num;
				paint.image_speed = 0;
			}
		}
		break;
}




imguigml_end();
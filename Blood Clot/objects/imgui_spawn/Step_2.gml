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
	
	var bonus_tab = imguigml_collapsing_header("Blood")
	if(bonus_tab[0])
	{
		imguigml_text("Cur Blood:" + cur_blood);
		
		var none = imguigml_button("None");
		if(none){ cur_blood = "None"}
		imguigml_same_line();
		var blood = imguigml_button("Light Blood");
		if(blood){ cur_blood = "Light Blood" }
		imguigml_same_line();
		var heavy_blood = imguigml_button("Heavy Blood");
		if(heavy_blood){ cur_blood = "Heavy Blood" }	
		
		//amount of blood
		imguigml_text("Amount of blood:")
		var amount_of_blood = imguigml_input_int("##amount_of_blood", blood_amount, 1, 10);
		if (amount_of_blood[0])
		{
			blood_amount = amount_of_blood[1];
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
switch(cur_blood)
{
	case "None":
		break;
		
	case "Light Blood":
		if(click)
		{
			repeat(blood_amount){instance_create_layer(mouse_x, mouse_y,"Particles",obj_light_blood);}
		}
		break;
		
	case "Heavy Blood":
	if(click)
		{
			repeat(blood_amount){instance_create_layer(mouse_x, mouse_y,"Particles",obj_blood);}
		}
		break;
}




imguigml_end();
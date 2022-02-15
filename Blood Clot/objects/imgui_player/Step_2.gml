/// @description 

#region close if needed

if(!instance_exists(imgui)){exit;}
if(!imguigml_ready()){exit;}

#endregion

#region get player variables

var player_properties = [0,0,0,0,0,0,0,0,0,0,0,spr_dead,0,0,0,0,0,0,0,0,0,false,false,false,false];
if(instance_exists(obj_player))
{
	player_properties[0] = obj_player.dead; 
	player_properties[1] = obj_player.on_ground; 
	player_properties[2] = obj_player.in_water; 
	player_properties[3] = obj_player.in_blood; 
	player_properties[4] = obj_player.holding_jump_key; 
	player_properties[5] = obj_player.cur_blood; 
	player_properties[6] = obj_player.max_blood; 
	player_properties[7] = obj_player.min_blood; 
	player_properties[8] = obj_player.x_scale; 
	player_properties[9] = obj_player.y_scale; 
	player_properties[10] = obj_player.alpha; 
	player_properties[11] = obj_player.sprite_index
	player_properties[12] = string(sprite_get_name(object_get_sprite(obj_player)));
	player_properties[13] = obj_player.h_speed; 
	player_properties[14] = obj_player.v_speed;
	player_properties[15] = obj_player.hold_time; 
	player_properties[16] = obj_player.max_hold_time;
	player_properties[17] =	round(obj_player.x);
	player_properties[18] = round(obj_player.y);
	player_properties[19] =	Level_Controller.spawn_x;
	player_properties[20] = Level_Controller.spawn_y;
	player_properties[21] = obj_player.dead;
	player_properties[22] = obj_player.on_ground;
	player_properties[23] = obj_player.in_water;
	player_properties[24] = obj_player.in_blood;
}

#endregion

//activate the initial window 
imguigml_set_next_window_size(menu_width, menu_height, EImGui_Cond.Once);
var player_window = imguigml_begin("Player Window",true);
	
//set window scale and display mode
imguigml_set_display_mode(EImGui_DisplayMode.GUIAspect)
imguigml_set_display_scale(scale,scale);

if(player_window[0] )
{
	
	imguigml_columns(3);
	{
		#region sprite and position properties
					
		//draw current sprite
		imguigml_set_column_width(0, 80);
		imguigml_sprite(player_properties[11],0,64,64);
		imguigml_text(player_properties[12]);
		
		imguigml_next_column();
		
		//is dead?
		imguigml_text("Dead:")
		imguigml_same_line();
		var chk_dead = imguigml_checkbox("", player_properties[21])
		if(chk_dead[0])
		{
			if(chk_dead[1]){ obj_player.dead = true; }		
		}
		
		
		//on ground
		imguigml_text("");
		imguigml_text("on_ground")
		imguigml_same_line();
		var chk_on_ground = imguigml_checkbox("",player_properties[22])
		if(chk_on_ground[0])
		{
			if(chk_on_ground[1]){ obj_player.on_ground = true; }			
		}
		
		//in water
		imguigml_text("in_water")
		imguigml_same_line();
		var chk_in_water = imguigml_checkbox("",player_properties[23])
		if(chk_in_water[0])
		{
			if(chk_in_water[1]){ obj_player.in_water = true; }			
		}
		
		//in blood
		imguigml_text("in_blood")
		imguigml_same_line();
		var chk_in_blood = imguigml_checkbox("",player_properties[24])
		if(chk_in_blood[0])
		{
			if(chk_in_blood[1]){ obj_player.in_blood = true; }			
		}
		
		
		//var chk_on_ground = imguigml_checkbox("on_ground:")		
		//var chk_in_water = imguigml_checkbox("in_water:")
		//var chk_in_blood = imguigml_checkbox("in_blood:")
		imguigml_text("");
		//var chk_holding_jump_key = imguigml_checkbox("holding_jump_jey:")
		
		
		
		
		
		imguigml_next_column();
		
		//draw x scale slider
		imguigml_text("x scale:");
		imguigml_same_line();
		_x_scale = imguigml_slider_float("##x_scale",player_properties[8],0,2);
		if(_x_scale[0])
		{
			player_properties[8] = _x_scale[1];
			obj_player.x_scale = _x_scale[1];				
		}
		
		//draw y scale slider
		imguigml_text("y scale:");
		imguigml_same_line();
		_y_scale = imguigml_slider_float("##y_scale",player_properties[9],0,2);
		if(_y_scale[0])
		{
			player_properties[9] = _y_scale[1];
			obj_player.y_scale = _y_scale[1];				
		}
		
		//player x and y pos
		imguigml_text("Player X:" + string(player_properties[17]) +
		" | " + "Player Y:" + string(player_properties[18]));
		
		//player spawn co-ords
		imguigml_text("X Spawn:  ")
		imguigml_same_line();
		imguigml_push_item_width(144);
		imguigml_same_line();
		imguigml_text("Y Spawn:")
		_xy_spawn = imguigml_input_int2("##xy_spawn", player_properties[19], player_properties[20]);
		if (_xy_spawn[0])
		{
			Level_Controller.spawn_x = _xy_spawn[1];
			Level_Controller.spawn_y = _xy_spawn[2];
		}
		
		//to spawn button
		imguigml_same_line();
		if(imguigml_button("To Spawn") and instance_exists(obj_player))
		{
			obj_player.x = Level_Controller.spawn_x;
			obj_player.y = Level_Controller.spawn_y;
		}
		//reset spawn
		imguigml_same_line();
		if(imguigml_button("Reset") and instance_exists(obj_player))
		{
			Level_Controller.spawn_x = default_spawn_x;
			Level_Controller.spawn_y = default_spawn_y;
		}
		
		//to finish button
		if(imguigml_button("To finish") and instance_exists(obj_player) and instance_exists(obj_finish))
		{
			obj_player.x = finish_x;
			obj_player.y = finish_y;
		}
		imguigml_same_line();
		if(imguigml_button("Next Level")){ room_goto_next(); }
		imguigml_same_line();
		if(imguigml_button("Previous Level")){ room_goto_previous(); }
			
		imguigml_next_column();
		
		
		
		imguigml_separator();
		
		#endregion
	}
	
	imguigml_columns(4);
	{
		
		#region column headers
	
		imguigml_text("Var"); 
		imguigml_push_item_width(32);
		imguigml_pop_item_width();  
		
		imguigml_next_column();
		
		imguigml_text("Min"); 
		imguigml_push_item_width(32);
		imguigml_pop_item_width();  
		
		imguigml_next_column();
	
		imguigml_text("Max"); 
		imguigml_push_item_width(32);
		imguigml_pop_item_width(); 
		
		imguigml_next_column();
		
		imguigml_text("Value"); 
		imguigml_push_item_width(32);
		imguigml_pop_item_width(); 
		
		imguigml_separator();
		imguigml_next_column();
		
		#endregion
		
		#region health
		
			#region var
		
			imguigml_text("Health"); 
			imguigml_pop_item_width();  
			imguigml_same_line();
			HelpHover("Min: min_blood\nMax: max_blood\nValue: cur_blood");
		
			#endregion
		
			#region min
		
			imguigml_next_column();
			_min_blood = imguigml_input_int("##min", player_properties[7], 1, 10);
			if (_min_blood[0])
			{
				if(_min_blood[1] >= 0)
				{
					if(_min_blood[1] < player_properties[6])
					{
						obj_player.min_blood = _min_blood[1];
					}			
				}		
			}
			imguigml_same_line();
			HelpHover("min_blood must be > 0\nmin_blood must be < max_blood");
		
			#endregion
			
			#region max
		
			imguigml_next_column();
			_max_blood = imguigml_input_int("##max", player_properties[6], 1, 10);
			if (_max_blood[0])
			{
				if(_max_blood[1] >= player_properties[7])
				{	
					obj_player.max_blood = _max_blood[1];				
				}		
			}
			imguigml_same_line();
			HelpHover("max_blood must be > min_blood");
		
			#endregion
			
			#region value
				
			imguigml_next_column();
			_cur_blood = imguigml_slider_int("##value",player_properties[5],player_properties[7],player_properties[6]);
			if(_cur_blood[0])
			{
				player_properties[5] = _cur_blood[1];
				obj_player.cur_blood = _cur_blood[1];				
			}
					
			#endregion		
			
			imguigml_separator();
			
		#endregion	
		
		#region acc
		
		#endregion
	}
	
	
	
	
	
	
	//close window if needed
	if(!player_window[1])
	{
		instance_destroy();	
	}
}

imguigml_end();
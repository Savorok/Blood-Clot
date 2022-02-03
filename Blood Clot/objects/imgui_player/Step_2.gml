/// @description 

#region close if needed

if(!instance_exists(imgui)){exit;}
if(!imguigml_ready()){exit;}

#endregion

#region get player variables

var player_properties = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
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
	player_properties[11] = //obj_player.
	player_properties[12] = string(sprite_get_name(object_get_sprite(obj_player)));
	player_properties[13] = obj_player.h_speed; 
	player_properties[14] = obj_player.v_speed;
	player_properties[15] = obj_player.hold_time; 
	player_properties[16] = obj_player.max_hold_time;
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
	}
	imguigml_columns(1);
		
		#region sprite properties
		
		
		imguigml_next_column();
		
		imguigml_sprite(spr_player,0,64,64);
		imguigml_text(player_properties[12])
		
		#endregion
	
	
	
	
	
	//close window if needed
	if(!player_window[1])
	{
		instance_destroy();	
	}
}

imguigml_end();
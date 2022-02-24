/// @description 

#region close if needed

if(!instance_exists(imgui)){exit;}
if(!imguigml_ready()){exit;}

#endregion

#region get player variables

var player_properties = [0,0,0,0,0,0,0,0,0,0,0,spr_dead,0,0,0,0,0,0,0,0,0,false,false,false,false];
var movement_properties = [0,0,0,0];
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
	
	movement_properties[0] = obj_player.h_speed;
	movement_properties[1] = obj_player.v_speed;
	
	
	if(obj_player.on_ground and !obj_player.in_water and !obj_player.in_blood)
	{
		movement_properties[2] = global.ground_acc;
		movement_properties[3] = global.ground_max_speed;
	}
	else if(obj_player.in_water)
	{
		movement_properties[2] = global.water_acc;
		movement_properties[3] = global.water_max_speed;
	}
	else if(obj_player.in_blood)
	{
		movement_properties[2] = global.blood_acc;
		movement_properties[3] = global.blood_max_speed;
	}
	else if(!obj_player.on_ground)
	{
		movement_properties[2] = global.air_acc;
		movement_properties[3] = global.air_max_speed;
	}
	
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
		
		imguigml_text("");	
		imguigml_next_column();
		
		//draw x scale slider
		imguigml_text("x scale:");
		imguigml_same_line();
		var _x_scale = imguigml_slider_float("##x_scale",player_properties[8],0,2);
		if(_x_scale[0])
		{
			player_properties[8] = _x_scale[1];
			obj_player.x_scale = _x_scale[1];				
		}
		
		//draw y scale slider
		imguigml_text("y scale:");
		imguigml_same_line();
		var _y_scale = imguigml_slider_float("##y_scale",player_properties[9],0,2);
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
		var _xy_spawn = imguigml_input_int2("##xy_spawn", player_properties[19], player_properties[20]);
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
	
	imguigml_columns(1);
	var health_tab = imguigml_collapsing_header("Health")
	if(health_tab[0])
	{
		//invincible
		imguigml_text("Invincible:")
		imguigml_same_line();
		var chk_invincible = imguigml_checkbox("##invincible", invincible)
		if(chk_invincible[0])
		{
			obj_player.invincible = chk_invincible[1];
			invincible = chk_invincible[1];
		}
		
		imguigml_same_line();
		
		//invincible
		imguigml_text("No_blood_loss:")
		imguigml_same_line();
		var chk_no_blood_loss = imguigml_checkbox("##No_blood_loss", no_blood_loss)
		if(chk_no_blood_loss[0])
		{
			obj_player.no_blood_loss = chk_no_blood_loss[1];
			no_blood_loss = chk_no_blood_loss[1];
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
		}
	}
	
	imguigml_columns(1);
	var cur_movement_tab = imguigml_collapsing_header("Current Movement Variabes")
	if(cur_movement_tab[0])
	{
		imguigml_text("h_speed:");
		imguigml_same_line();
		imguigml_slider_float("##h_speed_slider",movement_properties[0],-(movement_properties[3]),movement_properties[3]);
		imguigml_same_line();
		imguigml_text("v_speed:");
		imguigml_same_line();
		imguigml_slider_float("##v_speed_slider",movement_properties[1],-5,5);
		
		imguigml_text("Acc_amount:");
		imguigml_same_line();
		imguigml_input_float("##acc_amount",movement_properties[2],0.1,1.0,2);
		
		imguigml_text("Max_speed:");
		imguigml_same_line();
		imguigml_input_float("##Max_speed",movement_properties[3],0.1,1.0,2);
		
	}
	
	imguigml_columns(1);
	var movement_tab = imguigml_collapsing_header("Movement Variabes")
	if(movement_tab[0])
	{
		//master speed
		imguigml_text("Master Speed:");
		imguigml_same_line();
		var input_master_speed = imguigml_input_float("##master_speed",master_speed,0.1,1.0,2);
		if(input_master_speed[0])
		{
			Global_Controller.master_speed = input_master_speed[1];
			master_speed = input_master_speed[1];
		}
		
		
		imguigml_begin_tab_bar("Movement Variables")
		{
			//ground
			var ground_tab = imguigml_begin_tab_item("Ground")
			if(ground_tab[0])
			{
				imguigml_text("Acc:");
				imguigml_same_line();
				var input_ground_acc = imguigml_input_float("##input_ground_acc",ground_acc,0.1,1.0,1)
				if(input_ground_acc[0])
				{
					Global_Controller.ground_acc = input_ground_acc[1];
					ground_acc = input_ground_acc[1];
				}
				
				imguigml_text("Max speed:");
				imguigml_same_line();
				var input_max_speed = imguigml_input_float("##input_max_speed",ground_max_speed,0.1,1.0,1)
				if(input_max_speed[0])
				{
					Global_Controller.ground_max_speed = input_max_speed[1];
					ground_max_speed = input_max_speed[1];
				}
				
				imguigml_text("Jump Speed:");
				imguigml_same_line();
				var input_jump_speed = imguigml_input_float("##input_jump_speed",-ground_jump,0.1,1.0,1)
				if(input_jump_speed[0])
				{
					Global_Controller.jump_speed = -input_jump_speed[1];
					ground_jump = -input_jump_speed[1];
				}
				
				imguigml_end_tab_item();
			}
			
			//air
			var air_tab = imguigml_begin_tab_item("Air")
			if(air_tab[0])
			{
				imguigml_text("Acc:");
				imguigml_same_line();
				var input_air_acc = imguigml_input_float("##input_air_acc",air_acc,0.1,1.0,2)
				if(input_air_acc[0])
				{
					Global_Controller.air_acc = input_air_acc[1];
					air_acc = input_air_acc[1];
				}
				
				imguigml_text("Max speed:");
				imguigml_same_line();
				var input_air_max_speed = imguigml_input_float("##input_air_max_speed",air_max_speed,0.1,1.0,2)
				if(input_air_max_speed[0])
				{
					Global_Controller.air_max_speed = input_air_max_speed[1];
					air_max_speed = input_air_max_speed[1];
				}
				
				imguigml_text("Fric:");
				imguigml_same_line();
				var input_air_fric = imguigml_input_float("##input_air_fric",air_fric,0.1,1.0,3)
				if(input_air_fric[0])
				{
					Global_Controller.air_fric = input_air_fric[1];
					air_fric = input_air_fric[1];
				}
				
				
				
				imguigml_end_tab_item();
			}
			
			//water
			var water_tab = imguigml_begin_tab_item("Water")
			if(water_tab[0])
			{
				imguigml_text("Acc:");
				imguigml_same_line();
				var input_water_acc = imguigml_input_float("##input_water_acc",water_acc,0.1,1.0,2)
				if(input_water_acc[0])
				{
					Global_Controller.water_acc = input_water_acc[1];
					water_acc = input_water_acc[1];
				}
				
				imguigml_text("Max speed:");
				imguigml_same_line();
				var input_water_max_speed = imguigml_input_float("##input_water_max_speed",water_max_speed,0.1,1.0,2)
				if(input_water_max_speed[0])
				{
					Global_Controller.water_max_speed = input_water_max_speed[1];
					water_max_speed = input_water_max_speed[1];
				}
				
				imguigml_text("Fric:");
				imguigml_same_line();
				var input_water_fric = imguigml_input_float("##input_water_fric",water_fric,0.1,1.0,2)
				if(input_water_fric[0])
				{
					Global_Controller.water_fric = input_water_fric[1];
					water_fric = input_water_fric[1];
				}
				
				imguigml_text("Grav:");
				imguigml_same_line();
				var input_water_grav = imguigml_input_float("##input_water_grav",water_gravity,0.1,1.0,2)
				if(input_water_grav[0])
				{
					Global_Controller.water_gravity = input_water_grav[1];
					water_gravity = input_water_grav[1];
				}
				
				imguigml_text("Jump:");
				imguigml_same_line();
				var input_water_jump = imguigml_input_float("##input_water_jump",-water_jump_speed,0.1,1.0,2)
				if(input_water_jump[0])
				{
					Global_Controller.water_jump_speed = -input_water_jump[1];
					water_jump_speed = -input_water_jump[1];
				}
								
				imguigml_end_tab_item();
			}
			
			//blood
			var blood_tab = imguigml_begin_tab_item("Blood")
			if(blood_tab[0])
			{
				imguigml_text("Acc:");
				imguigml_same_line();
				var input_blood_acc = imguigml_input_float("##input_blood_acc",blood_acc,0.1,1.0,2)
				if(input_blood_acc[0])
				{
					Global_Controller.blood_acc = input_blood_acc[1];
					blood_acc = input_blood_acc[1];
				}
				
				imguigml_text("Max speed:");
				imguigml_same_line();
				var input_blood_max_speed = imguigml_input_float("##input_blood_max_speed",blood_max_speed,0.1,1.0,2)
				if(input_blood_max_speed[0])
				{
					Global_Controller.blood_max_speed = input_blood_max_speed[1];
					blood_max_speed = input_blood_max_speed[1];
				}
				
				imguigml_text("Fric:");
				imguigml_same_line();
				var input_blood_fric = imguigml_input_float("##input_blood_fric",blood_fric,0.1,1.0,2)
				if(input_blood_fric[0])
				{
					Global_Controller.blood_fric = input_blood_fric[1];
					blood_fric = input_blood_fric[1];
				}
				
				imguigml_text("Grav:");
				imguigml_same_line();
				var input_blood_grav = imguigml_input_float("##input_blood_grav",blood_gravity,0.1,1.0,2)
				if(input_blood_grav[0])
				{
					Global_Controller.blood_gravity = input_blood_grav[1];
					blood_gravity = input_blood_grav[1];
				}
				
				imguigml_text("Jump:");
				imguigml_same_line();
				var input_blood_jump = imguigml_input_float("##input_blood_jump",-blood_jump_speed,0.1,1.0,2)
				if(input_blood_jump[0])
				{
					Global_Controller.blood_jump_speed = -input_blood_jump[1];
					blood_jump_speed = -input_blood_jump[1];
				}
				
				
				imguigml_end_tab_item();
			}
			
			//level
			var level_tab = imguigml_begin_tab_item("Level")
			if(level_tab[0])
			{
				imguigml_text("Fric:");
				imguigml_same_line();
				var input_level_fric = imguigml_input_float("##input_level_fric",level_fric,0.1,1.0,2)
				if(input_level_fric[0])
				{
					Level_Controller.level_fric = input_level_fric[1];
					level_fric = input_level_fric[1];
				}
				
				imguigml_text("Grav:");
				imguigml_same_line();
				var input_level_grav = imguigml_input_float("##input_level_grav",level_grav,0.1,1.0,2)
				if(input_level_grav[0])
				{
					Level_Controller.level_grav = input_level_grav[1];
					level_grav = input_level_grav[1];
				}
						
				imguigml_end_tab_item();
			}
			
			//wall
			var wall_tab = imguigml_begin_tab_item("Wall")
			if(wall_tab[0])
			{
				imguigml_text("Vertical Jump Towards");
				imguigml_same_line();
				var input_vjt = imguigml_input_float("##input_vjt",v_jump_t,0.1,1.0,2)
				if(input_vjt[0])
				{
					Global_Controller.v_jump_t = input_vjt[1];
					v_jump_t = input_vjt[1];
				}
				
				imguigml_text("Horizontal Jump Towards");
				imguigml_same_line();
				var input_hjt = imguigml_input_float("##input_hjt",h_jump_t,0.1,1.0,2)
				if(input_hjt[0])
				{
					Global_Controller.h_jump_t = input_hjt[1];
					h_jump_t = input_hjt[1];
				}
				
				imguigml_text("Vertical Jump Away");
				imguigml_same_line();
				var input_vja = imguigml_input_float("##input_vja",v_jump_a,0.1,1.0,2)
				if(input_vja[0])
				{
					Global_Controller.v_jump_a = input_vja[1];
					v_jump_a = input_vja[1];
				}
				
				imguigml_text("Horizontal Jump Away");
				imguigml_same_line();
				var input_hja = imguigml_input_float("##input_hja",h_jump_a,0.1,1.0,2)
				if(input_hja[0])
				{
					Global_Controller.h_jump_a = input_hja[1];
					h_jump_a = input_hja[1];
				}
				
				
				imguigml_end_tab_item();
			}
			
			imguigml_end_tab_bar();
		}
	}
	
	
	
	
	
	//close window if needed
	if(!player_window[1])
	{
		instance_destroy();	
	}
}

imguigml_end();
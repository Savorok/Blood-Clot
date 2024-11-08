///@description This function handles all player movement, 
//local refrances to movement varibales are obtained from the global controller and are set based
//on where the player is
function scr_calculate_player_movement()
{
	//init variables
	var acc, max_speed, fric;
	var minimum_velocity = 0.3;
	
	var left_wall = place_meeting(x-global.wall_jump_threshold,y,obj_solid);
	var right_wall = place_meeting(x+global.wall_jump_threshold,y,obj_solid);
		
	#region Get key inputs
			
	key_left = keyboard_check(ord("A")) or (gamepad_button_check(0,gp_padl)) or (gamepad_axis_value(0,gp_axislh)  < 0);
	key_right = keyboard_check(ord("D")) or (gamepad_button_check(0,gp_padr)) or (gamepad_axis_value(0,gp_axislh) > 0);
	key_jump = keyboard_check_pressed(vk_space) or (gamepad_button_check_pressed(0,gp_face1));
	key_jump_release = keyboard_check_released(vk_space) or (gamepad_button_check_released(0,gp_face1));
				
	#endregion
		
	#region start timer
	
	if(!Level_Controller.count_up)
	{
		if(key_left or key_right or key_jump)
		{
			Level_Controller.count_up = true;	
		}
	}
	
	#endregion
		
		
	#region set acc, max speed and friction 
		
		if(!on_ground and !in_water and !in_blood)
		{
			acc = global.air_acc;
			max_speed = global.air_max_speed;
			fric = global.air_fric;
		}
		else if(in_water)
		{
			acc = global.water_acc;
			max_speed = global.water_max_speed;
			fric = global.water_fric
		}
		else if(in_blood)
		{
			acc = global.blood_acc;
			max_speed = global.blood_max_speed;
			fric = global.blood_fric
		}
		else
		{
			acc = global.ground_acc;
			max_speed = global.ground_max_speed;
			fric = Level_Controller.room_friction;
		}
		
		#endregion
		
	#region calculate movement
		
		#region left and right
		
		//left
		if(key_left)
		{
			h_speed -= acc;
			if(h_speed > minimum_velocity){ h_speed -= fric;}
			//drop some blood
			if(!in_water and !in_blood)
			{
				alarm[1] = random_range(1,4)
			}		
		}
		//right
		if(key_right)
		{
			h_speed +=	acc;
			if(h_speed < -minimum_velocity){h_speed += fric;}
			//drop some blood
			if(!in_water and !in_blood)
			{
				alarm[1] = random_range(1,4)
			}	
		}
		//cancel friction
		if((!key_left and !key_right) or (key_left and key_right))
		{
			if(h_speed > minimum_velocity){h_speed -= fric;}
			else if(h_speed < -minimum_velocity){h_speed += fric;}
			else{h_speed = 0;};
		}
		
		//limit speed
		if(h_speed > max_speed){h_speed = max_speed;}
		if(h_speed < -max_speed){h_speed = -max_speed;}
		
		#endregion
		
		#region jumping
		
		if(key_jump and on_ground and !in_water and !in_blood)
		{
			v_speed = global.jump_speed;		
			//scale player
			x_scale = 0.75;
			y_scale = 1.25;
			//drop some blood
			alarm[1] = random_range(1,4)
			holding_jump_key = true;
		}	
		if(key_jump and in_water)
		{
			v_speed = global.water_jump_speed;	
			//scale player
			x_scale = 0.75;
			y_scale = 1.25;
			//drop some blood
			alarm[4] = random_range(1,4)
			holding_jump_key = true;
		}
		if(key_jump and in_blood)
		{
			v_speed = global.blood_jump_speed;	
			//scale player
			x_scale = 0.75;
			y_scale = 1.25;
			//drop some blood
			alarm[4] = random_range(1,4)
			holding_jump_key = true;
		}		
		if(key_jump_release){holding_jump_key = false;}
		
		#endregion
		
		#region wall jumping
		
		if(!on_ground and (left_wall or right_wall))
		{
			if(key_jump)
			{
				if(left_wall and key_left)
				{
					h_speed = global.jump_speed*-global.h_jump_towards;
					v_speed = global.jump_speed*global.v_jump_towards;
					//drop some blood
					if(!in_water and !in_blood)
					{
						alarm[3] = random_range(10,15);
					}
				}
				else if(left_wall and !key_left)
				{
					h_speed = global.jump_speed*-global.h_jump_away;
					v_speed = global.jump_speed*global.v_jump_away;
					//drop some blood
					if(!in_water and !in_blood)
					{
						alarm[3] = random_range(10,15);
					}
				}
				else if(right_wall and key_right)
				{
					h_speed = global.jump_speed*global.h_jump_towards;
					v_speed = global.jump_speed*global.v_jump_towards;
					//drop some blood
					if(!in_water and !in_blood)
					{
						alarm[2] = random_range(10,15);
					}
				}
				else if(right_wall and !key_right)
				{
					h_speed = global.jump_speed*global.h_jump_away;
					v_speed = global.jump_speed*global.v_jump_away;
					//drop some blood
					if(!in_water and !in_blood)
					{
						alarm[2] = random_range(10,15);
					}
				}
				
				//adjust scale
				x_scale = 0.75;
				y_scale = 1.25;
				
				holding_jump_key = true;
			}
		}
		
		#endregion
		
		#region wall sliding
		
		if((left_wall or right_wall) and !on_ground and v_speed >= 0.5 and !in_water and !in_blood)
		{
			v_speed -= Level_Controller.room_gravity*-0.3	
		}
		//create blood while sliding down walls
		if(!in_water and !in_blood)
		{
			if(right_wall and v_speed > 0){alarm[2]=1;}
			if(left_wall and v_speed > 0){alarm[3]=1;}
		}
		#endregion
	
	#endregion
		
}
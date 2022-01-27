
function scr_player_movement()
{
	//init variables
	var acc, max_speed, fric;
	var minimum_velocity = 0.3;
	
	var left_wall = place_meeting(x-1,y,obj_solid);
	var right_wall = place_meeting(x+1,y,obj_solid);
	
	
	#region Get key inputs
			
	key_left = keyboard_check(ord("A"));
	key_right = keyboard_check(ord("D"));
	key_action = keyboard_check(ord("E"));
	key_action_release = keyboard_check_released(ord("E"));
	key_jump = keyboard_check_pressed(vk_space);
	key_jump_release = keyboard_check_released(vk_space);
				
	#endregion
		
	#region set acc, max speed and friction 
		
		if(!on_ground)
		{
			acc = global.air_acc;
			max_speed = global.air_max_speed;
			fric = global.air_fric;
		}
		else
		{
			acc = global.ground_acc;
			max_speed = global.ground_max_speed;
			fric = Level_Controller.room_friction;
		}
		
		#endregion
		
	#region calculate movement
		
		//left
		if(key_left)
		{
			h_speed -= acc;
			if(h_speed > minimum_velocity){ h_speed -= fric;}
			//drop some blood
			alarm[3] = random_range(1,4)
			
		}
		//right
		if(key_right)
		{
			h_speed +=	acc;
			if(h_speed < -minimum_velocity){h_speed += fric;}
			//drop some blood
			alarm[3] = random_range(1,4)
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
		
		//jumping
		if(key_jump and on_ground)
		{
			v_speed = global.jump_speed;
			
			//scale player
			x_scale = 0.75;
			y_scale = 1.25;
			
			holding_jump_key = true;
			
			//drop some blood
			alarm[3] = random_range(1,4)
		}
		if(key_jump_release){holding_jump_key = false;}
		
		
		//wall jumping
		if(!on_ground and (left_wall or right_wall))
		{
			if(key_jump)
			{
				if(left_wall and key_left)
				{
					h_speed = global.jump_speed*-global.h_jump_towards;
					v_speed = global.jump_speed*global.v_jump_towards;
				}
				else if(left_wall and !key_left)
				{
					h_speed = global.jump_speed*-global.h_jump_away;
					v_speed = global.jump_speed*global.v_jump_away;
				}
				else if(right_wall and key_right)
				{
					h_speed = global.jump_speed*global.h_jump_towards;
					v_speed = global.jump_speed*global.v_jump_towards;
				}
				else if(right_wall and !key_right)
				{
					h_speed = global.jump_speed*global.h_jump_away;
					v_speed = global.jump_speed*global.v_jump_away;
				}
				
				//adjust scale
				x_scale = 0.75;
				y_scale = 1.25;
			}
			holding_jump_key = true;
		}
		
		//wall sliding
		if((left_wall or right_wall) and !on_ground and v_speed >= 0.5)
		{
			v_speed -= Level_Controller.room_gravity*-0.3	
		}
		
	
		#endregion
		
	#region move and check for collisions 
		
	scr_collision();	
	
	#endregion
	
	#region kill self
	
	if(key_action)
	{
		hold_time += 1;
		x_scale += 0.025;
		y_scale -= 0.025;
		
		if(hold_time >= max_hold_time)
		{
			var blood_amount = irandom_range(Blood_Controller.splatter_size-10,Blood_Controller.splatter_size+10);
			repeat(blood_amount) instance_create_depth(obj_player.x,obj_player.y,1,obj_blood);
			dead = true;
		}
	}
	else
	{
		hold_time = 0;
	}
	
	#endregion
	
}
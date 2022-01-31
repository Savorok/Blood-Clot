
function scr_player_movement_water()
{
	//init variables
	var acc, max_speed, fric;
	var minimum_velocity = 0.3;
	
	var left_wall = place_meeting(x-1,y,obj_solid);
	var right_wall = place_meeting(x+1,y,obj_solid);
	
	
	#region Get key inputs
			
	key_left = keyboard_check(ord("A"));
	key_right = keyboard_check(ord("D"));
	key_jump = keyboard_check_pressed(vk_space);
	key_jump_release = keyboard_check_released(vk_space);
				
	#endregion
		
	#region set acc, max speed and friction 
		
	acc = global.water_acc;
	max_speed = global.water_max_speed;
	fric = global.water_fric;
			
	#endregion
		
	#region calculate movement
		
		//left
		if(key_left)
		{
			h_speed -= acc;
			if(h_speed > minimum_velocity){ h_speed -= fric;}
			//drop some blood
			//alarm[1] = random_range(1,4)
		}
		//right
		if(key_right)
		{
			h_speed +=	acc;
			if(h_speed < -minimum_velocity){h_speed += fric;}
			//drop some blood
			//alarm[1] = random_range(1,4)
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
		if(key_jump)
		{
			v_speed = global.water_jump_speed;
			
			//scale player
			x_scale = 0.75;
			y_scale = 1.25;
					
			//drop some blood
			//alarm[1] = random_range(1,4)
		}	
		
	#endregion
			
	#region move and check for collisions 
		
	scr_collision();	
	
	#endregion
		
}
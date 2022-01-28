function scr_player_action(){

	key_action = keyboard_check(ord("E"));
	key_action_release = keyboard_check_released(ord("E"));
	
	if(key_action and cur_blood > min_blood )
	{
		hold_time += 1;
		
		//limit player scale
		if(x_scale >= 1.25 or y_scale <= 0.75)
		{
			x_scale = 1.25;
			y_scale = 0.75;
		}
		else
		{
			x_scale += 0.025;
			y_scale -= 0.025;
		}
			
		
		//Camera_Controller.shaking = true;
		
		//small blood
		if(hold_time < max_hold_time)
		{
			var blood_amount = irandom_range(hold_time/5, hold_time);
			repeat(blood_amount) instance_create_depth(obj_player.x,obj_player.y,1,obj_light_blood);
			cur_blood -= blood_amount;
			alpha -= blood_amount/10000;
		}
		//large blood
		else 
		{
			var blood_amount = irandom_range(hold_time/10, hold_time/5);
			repeat(blood_amount) instance_create_depth(obj_player.x,obj_player.y,1,obj_blood);
			cur_blood -= blood_amount;
			alpha -= blood_amount/10000;
			Camera_Controller.zoom = true;
		}
				
		//limit hold time
		if(hold_time >= max_hold_time){ hold_time = max_hold_time; }
		
	}
	else if(key_action_release)
	{
		hold_time = 0;
		Camera_Controller.zoom = false;
		//Camera_Controller.shaking = false;
	}
	else
	{
		hold_time = 0;	
	}
}
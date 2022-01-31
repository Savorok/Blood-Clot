if(!Level_Controller.paused)
{
	if(!dead)
	{
		//check if we are in the water
		if(place_meeting(x,y,obj_water)){ cur_state = "in water"; }
		else{ cur_state = "on ground"; }
		
		switch(cur_state)
		{
			case "on ground":
				//handle player movement and collision
				scr_player_movement_ground();
				//check if player is grounded
				on_ground = scr_player_grounded();
				break;
			
			case "in water":
				show_debug_message("In water");
				scr_player_movement_water();
				scr_player_water_gravity();
				break;
		}
					
		//player action 
		scr_player_action();
		
		//scale player
		scr_player_scale();
		
		//manage alpha
		scr_player_alpha();
		
		//create hold-bar if needed
		if(hold_time >= 1)
		{
			if(!instance_exists(obj_hold_bar))
			{
				instance_create_depth(obj_player.x,obj_player.y - 18,1,obj_hold_bar)	
			}
		}
		
		//check blood level
		if(cur_blood <= min_blood)
		{
			var amount_of_blood = irandom_range(Blood_Controller.splatter_size/2,Blood_Controller.splatter_size)
			repeat(amount_of_blood) instance_create_depth(obj_player.x,obj_player.y,-100,obj_fast_blood);//crete blood splatter
			dead = true;
		}
		
	}
	else
	{
		//set respawn timer and destroy player
		Level_Controller.alarm[0] = Level_Controller.respawn_time;
		//stop camera shaking and zooming
		Camera_Controller.shaking = false;
		Camera_Controller.zoom = false;
				
		instance_destroy();	
	}
}

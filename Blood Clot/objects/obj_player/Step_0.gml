if(!Level_Controller.paused)
{
	if(!dead and !Level_Controller.free_cam)
	{
		
		//get the players state and handle gravity
		scr_player_state();
		//calculate player movement (get input)
		if(Level_Controller.accept_input) {scr_calculate_player_movement()};
		//check for collisions and move
		scr_collision_check_and_move();							
		//player action 
		if(Level_Controller.accept_input) {scr_player_action()};
		//scale player
		scr_player_scale();
		//manage alpha
		scr_player_alpha();
		
		//create hold-bar if needed
		if(hold_time >= 1)
		{
			if(!instance_exists(obj_hold_bar))
			{
				instance_create_layer(obj_player.x,obj_player.y - 18,"Instances",obj_hold_bar)	
			}
		}
		
		//check blood level
		if(cur_blood <= min_blood and !invincible)
		{
			var amount_of_blood = irandom_range(Blood_Controller.splatter_size/2,Blood_Controller.splatter_size)
			repeat(amount_of_blood) instance_create_layer(obj_player.x,obj_player.y,"Particles",obj_fast_blood);//crete blood splatter
			dead = true;
		}	
		
		//bleed if bleeding
		if(bleeds > 0)
		{
			bleed_per_sec = scr_bleed(bleeds);
		}
		else
		{
			bleed_per_sec = 0;
		}
		
		//if ghost is enabled record player movement
		if(Level_Controller.ghost_enabled)
		{
			//data for ghost player
			actions[step,0] = x; 
			actions[step,1] = y; 
			actions[step,2] = image_xscale;
			actions[step,3] = image_yscale;
			
			step++;
		}
	}
	else
	{
		//set respawn timer and destroy player
		Level_Controller.alarm[0] = Level_Controller.respawn_time;
		//stop camera shaking and zooming
		Camera_Controller.shaking = false;
		Camera_Controller.zoom = false;
				
		//give ghost data to the level controller
		if(Level_Controller.ghost_enabled)
		{
			Level_Controller.ghosts[Level_Controller.ghost_num] = actions;
			Level_Controller.ghost_num++;
		}
				
		instance_destroy();	
	}
}

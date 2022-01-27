if(!Level_Controller.paused)
{
	if(!dead)
	{
		#region movement and collision
		
		//handle player movement and collision
		scr_player_movement();

		//check if player is grounded
		on_ground = scr_player_grounded();
		
		#endregion
	
		//scale player
		scr_player_scale();
		
		//create hold-bar if needed
		if(hold_time >= 1)
		{
			if(!instance_exists(obj_hold_bar))
			{
				instance_create_depth(obj_player.x,obj_player.y - 18,1,obj_hold_bar)	
			}
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

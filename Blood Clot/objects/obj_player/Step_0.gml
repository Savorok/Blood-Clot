if(!Level_Controller.paused)
{
	if(!dead)
	{
		//handle player movement and collision
		scr_player_movement();

		//check if player is grounded
		on_ground = scr_player_grounded();
	
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
		instance_destroy();	
	}
}

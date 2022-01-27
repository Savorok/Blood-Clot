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
	}
	else
	{
		//set respawn timer and destroy player
		Level_Controller.alarm[0] = Level_Controller.respawn_time;
		instance_destroy();	
	}
}

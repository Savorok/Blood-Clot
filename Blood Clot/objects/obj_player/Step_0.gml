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
}

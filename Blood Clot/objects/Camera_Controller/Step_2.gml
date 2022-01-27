/// @description set camera to player

if(!Level_Controller.paused)
{
	if(instance_exists(obj_player))
	{
		scr_player_camera();	
	}
}



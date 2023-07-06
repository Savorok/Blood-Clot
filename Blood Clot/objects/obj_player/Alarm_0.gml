/// @description Kill player with no respawn
if(!invincible)
{
	var amount_of_blood = irandom_range(Blood_Controller.splatter_size-40,Blood_Controller.splatter_size+40)
	repeat(amount_of_blood) instance_create_layer(obj_player.x,obj_player.y,"Particles",obj_fast_blood);//crete blood splatter
	Level_Controller.can_respawn = false;
	
	//give ghost data to the level controller
	if(Level_Controller.ghost_enabled)
	{
		Level_Controller.ghosts[Level_Controller.ghost_num] = actions;
		Level_Controller.ghost_num++;
	}
	
	//kill player
	instance_destroy();
}
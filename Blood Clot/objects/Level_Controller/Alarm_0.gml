/// @description Spawn new player and if applicable ghosts
if(can_respawn)
{
	//player
	instance_create_layer(spawn_x,spawn_y,"Instances",obj_player);
	
	if(ghost_enabled)
	{
		//ghost
		for(var i = 0; i < array_length(ghosts); i++)
		{
			show_debug_message("here");
			var _ghost = instance_create_layer(obj_player.x, obj_player.y,"Instances",obj_ghost)
			_ghost.actions = ghosts[i]
		}
	}
}
else
{
	alarm[0] = 1;	
}
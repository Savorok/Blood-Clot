/// @description Spawn new player
if(can_respawn)
{
	instance_create_layer(spawn_x,spawn_y,"Instances",obj_player);
}
else
{
	alarm[0] = 1;	
}
/// @description Spawn new player
if(can_respawn)
{
	instance_create_depth(spawn_x,spawn_y,1,obj_player);
}
else
{
	alarm[0] = 1;	
}
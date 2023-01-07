/// @description spawn player camera
//if player exists and no camera make one
if(instance_exists(obj_player))
{
	if(!instance_exists(obj_player_camera))
	{
		instance_create_layer(obj_player.x,obj_player.y,"Controllers",obj_player_camera);
	}
}
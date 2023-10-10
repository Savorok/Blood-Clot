/// @description spawn player camera
//if player exists and no camera make one
if(instance_exists(obj_player) && obj_player.IJ = false)
{
	if(!instance_exists(obj_player_camera))
	{
		//create the new camera
		cam = instance_create_layer(obj_player.x,obj_player.y,"Controllers",obj_player_camera);
		//set new camera to be player
		cur_active_camera = cam;
	}
}
else if(instance_exists(obj_player) && obj_player.IJ)
{
	if(!instance_exists(obj_player_camera_IJ))
	{
		//create the new camera
		cam = instance_create_layer(obj_player.x,obj_player.y,"Controllers",obj_player_camera_IJ);
		//set new camera to be player
		cur_active_camera = cam;
	}
}

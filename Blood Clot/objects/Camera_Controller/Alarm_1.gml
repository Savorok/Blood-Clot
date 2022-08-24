/// @description spawn review camera


if(instance_exists(obj_player_camera))
{
	obj_player_camera.alarm[0] = 1;
}

if(!instance_exists(obj_room_camera))
{
	instance_create_layer(obj_finish.x,obj_finish.y,"Controllers",obj_room_camera);	
	cur_active_camera = obj_room_camera;
}
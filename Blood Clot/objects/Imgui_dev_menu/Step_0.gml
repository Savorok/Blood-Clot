/// @description make dev menu

//debug functionality
key_debug = keyboard_check_pressed(vk_f1);
if(key_debug and !debug){ debug = true; }
else if(key_debug and debug){ debug = false; }

if(free_cam)
{
	if(instance_exists(obj_player_camera) and !instance_exists(obj_room_camera))
	{
		var px = obj_player_camera.x;
		var py = obj_player_camera.y;
		
		obj_player_camera.alarm[0] = 1;
		
		instance_create_layer(px,py,"Controllers",obj_room_camera);
	}
}
else if(!free_cam)
{
	if(instance_exists(obj_room_camera) and instance_exists(obj_player) and !instance_exists(obj_player_camera))
	{	
		obj_room_camera.alarm[1] = 1;
		
		instance_create_layer(obj_player.x,obj_player.y,"Controllers",obj_player_camera);
	}
}
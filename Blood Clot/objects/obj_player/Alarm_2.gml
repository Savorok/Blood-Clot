/// @description Create blood on right wall
if(!Level_Controller.paused)
{
	var blood_amount = irandom_range(0,2);
	repeat(blood_amount) instance_create_depth(obj_player.x,obj_player.y,-100,obj_blood_wall_right);	
}


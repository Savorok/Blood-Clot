/// @description Create blood on right wall
if(!Level_Controller.paused and !no_blood_loss)
{
	var blood_amount = irandom_range(0,2);
	repeat(blood_amount) instance_create_layer(obj_player.x,obj_player.y,"Particles",obj_blood_wall_right);	
	cur_blood -= blood_amount;
}


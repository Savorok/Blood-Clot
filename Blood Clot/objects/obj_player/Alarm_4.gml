/// @description blood in water
/// @description Create blood while walking
if(!Level_Controller.paused and !no_blood_loss)
{
	var blood_amount = irandom_range(2,8);
	repeat(blood_amount) instance_create_layer(obj_player.x,obj_player.y,"Particles",obj_light_blood);	
	cur_blood -= blood_amount;
}

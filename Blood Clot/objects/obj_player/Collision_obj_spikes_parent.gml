/// @description Kill when touching
if(!no_blood_loss)
{
	var blood_amount = irandom_range(Blood_Controller.splatter_size-10,Blood_Controller.splatter_size+10);
	repeat(blood_amount) instance_create_layer(obj_player.x,obj_player.y,"Particles",obj_blood);
}
dead = true;

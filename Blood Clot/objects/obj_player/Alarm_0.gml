/// @description Kill player with no respawn
if(!invincible)
{
	var amount_of_blood = irandom_range(Blood_Controller.splatter_size-40,Blood_Controller.splatter_size+40)
	repeat(amount_of_blood) instance_create_layer(obj_player.x,obj_player.y,"Particles",obj_fast_blood);//crete blood splatter
	Level_Controller.can_respawn = false;
	//kill player
	instance_destroy();
}
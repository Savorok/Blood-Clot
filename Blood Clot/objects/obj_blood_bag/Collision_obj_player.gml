/// @description blow up when player touches
var blood_amount = irandom_range(10,50);
repeat(blood_amount) instance_create_layer(x,y,"Particles",obj_light_blood);

obj_player.cur_blood += 3000;
if(obj_player.cur_blood > 3000)
{
	obj_player.cur_blood = 3000
}



instance_destroy();
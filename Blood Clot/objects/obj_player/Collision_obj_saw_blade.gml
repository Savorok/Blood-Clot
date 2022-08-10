
repeat(3) 
{
	instance_create_layer(obj_player.x,obj_player.y,"Particles",obj_fast_blood);
}
cur_blood -= 3;
bleed_chance = irandom_range(0,10);
if(bleed_chance == 1)
{
	bleeds++;	
}

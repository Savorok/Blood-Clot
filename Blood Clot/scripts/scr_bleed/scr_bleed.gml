function scr_bleed(bleeds)
{
	repeat(irandom_range(0,bleeds))
	{
		instance_create_layer(x,y,"Particles",obj_blood);
	}
	cur_blood -= round(bleeds/2);
	return round(bleeds/2);
}
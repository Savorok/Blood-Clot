
scr_calculate_water_colour();

if(cur_water <= 0)
{
	var obj = instance_create_depth(x,y,1,obj_liquid_blood);
	obj.image_xscale = image_xscale;
	obj.image_yscale = image_yscale;
	
	instance_destroy();
}


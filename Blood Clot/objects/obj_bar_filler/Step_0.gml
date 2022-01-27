if(instance_exists(obj_hold_bar))
{
	//keep in place 
	x = obj_hold_bar.x - 8;
	y = obj_hold_bar.y - 1;
	
	//calculate scale
	if(cur_length <= 16)
	{
		var n1
		//calculates the % out of 35 ticks
		n1 = (obj_player.hold_time/max_length)*100;
		//turns it into a number relative to 16
		cur_length = .16*n1
		
		
	}
	else
	{
		cur_length = 16;
	}
}
else
{
	instance_destroy();	
}

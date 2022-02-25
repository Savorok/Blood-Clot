if(instance_exists(obj_hold_bar))
{
	//keep in place 
	x = obj_hold_bar.x - 8;
	y = obj_hold_bar.y - 1;
	
	//calculate scale
	if(cur_length < 16)
	{
		//calculate t as a number between 0 and 1
		var t = obj_player.hold_time/max_length;
		//get value between 0 and 16 given t
		cur_length = lerp(0,16,t);
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



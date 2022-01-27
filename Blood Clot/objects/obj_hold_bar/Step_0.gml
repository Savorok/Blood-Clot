if(instance_exists(obj_player))
{
	//stay in right place
	x = obj_player.x;
	y = obj_player.y - 18;
	
	//creating loading filler
	if(!instance_exists(obj_bar_filler))
	{
		instance_create_depth(x - 8,y - 1,1,obj_bar_filler);
	}
	
	//destroy if needed
	if(obj_player.hold_time < 1)
	{
		instance_destroy();
	}
}
else
{
	instance_destroy();	
}
if(instance_exists(obj_player))
{
	//stay in right place
	x = obj_player.x;
	y = obj_player.y - 18;
	
	show_debug_message("X Pos:" + string(x) + "|Y Pos:" + string(y))
		
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
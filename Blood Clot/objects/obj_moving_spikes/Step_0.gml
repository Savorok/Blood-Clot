/// @description 

if(active)
{
	show_debug_message($"Y:{spikes.y}");
	
	//up
	if(rot == 0)
	{
		if(spikes.y > y)
		{
			spikes.y -= 1;	
		}
		else if(spikes.y == y)
		{
			if(!deactivating)
			{
				alarm[0] = deactivate_delay
				deactivating = true;
			}
		}
	}
	//right
	else if(rot == -90)
	{
		
	}
	//down
	else if(abs(rot) == 180)
	{
		
	}
	//left
	else if(rot == 90)
	{
		
	}
}
else
{
	//up
	if(rot == 0)
	{
		if(spikes.y < y+16)
		{
			spikes.y += 1;	
		}
	}
	//right
	else if(rot == -90)
	{
		
	}
	//down
	else if(abs(rot) == 180)
	{
		
	}
	//left
	else if(rot == 90)
	{
		
	}
}

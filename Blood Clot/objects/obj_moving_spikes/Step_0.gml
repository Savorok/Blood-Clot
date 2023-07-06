/// @description activate & deactivate spikes

#region // activate

if(active)
{	
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
		if(spikes.x < x-16)
		{
			spikes.x += 1;	
		}
		else if(spikes.x == x-16)
		{
			if(!deactivating)
			{
				alarm[0] = deactivate_delay
				deactivating = true;
			}
		}
	}
	//down
	//spikes = instance_create_layer(x-16,y-32,"Instances",obj_spikes_down);
	else if(abs(rot) == 180)
	{
		if(spikes.y < y-16)
		{
			spikes.y += 1;	
		}
		else if(spikes.y == y-16)
		{
			if(!deactivating)
			{
				alarm[0] = deactivate_delay
				deactivating = true;
			}
		}
	}
	//left
	else if(rot == 90)
	{
		if(spikes.x > x)
		{
			spikes.x -= 1;	
		}
		else if(spikes.x == x)
		{
			if(!deactivating)
			{
				alarm[0] = deactivate_delay
				deactivating = true;
			}
		}
	}
}

#endregion

#region //deactivate

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
		if(spikes.x > x-32)
		{
			spikes.x -= 1;	
		}
	}
	//down
	else if(abs(rot) == 180)
	{
		if(spikes.y > y-32)
		{
			spikes.y -= 1;	
		}
	}
	//left
	else if(rot == 90)
	{
		if(spikes.x < x+16)
		{
			spikes.x += 1;	
		}
	}
}

#endregion

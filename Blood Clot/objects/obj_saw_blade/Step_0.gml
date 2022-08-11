
if(!Level_Controller.paused)
{
	//move left and right
	//go right
	if(dir = "right")
	{
		x += spd
		if(x >= start_x+track_length-edge_buffer*2)
		{
			dir = "left";
		}
	}
	//go left
	else if(dir = "left")
	{
		x -= spd
		if(x <= start_x)
		{
			dir = "right";
		}
	}
	//go up
	else if(dir = "up")
	{
		y -= spd
		if(y <= start_y-track_length+edge_buffer*2)
		{
			dir = "down";
		}
	}
	//go down
	else if(dir = "down")
	{
		y += spd
		if(y >= start_y)
		{
			dir = "up";
		}
	}

	//rotate saw
	image_angle += spd*10;
}




/// @description follow given path

if(!Level_Controller.paused)
{
	if(step < array_length(actions))
	{
		x = actions[step,0];
		y = actions[step,1];
		image_xscale = actions[step,2];
		image_yscale = actions[step,3];
		
		step++;
	}
	else
	{
		instance_destroy();
	}
}

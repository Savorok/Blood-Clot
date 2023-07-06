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
	else if(!Level_Controller.level_complete)
	{
		instance_destroy();
	}
	//when in review loop wining ghost
	else
	{
		Level_Controller.alarm[3] = 1;
		instance_destroy();
	}
	
	if(!instance_exists(obj_player))
	{
		instance_destroy();	
	}
}
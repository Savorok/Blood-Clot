if(!activated and Level_Controller.debug)
{
	draw_self();
}
else if(activated and !Level_Controller.debug)
{
	draw_self();
	image_index = 1;
}
else if(activated and Level_Controller.debug)
{
	draw_self();
	image_speed = 0.1;	
}



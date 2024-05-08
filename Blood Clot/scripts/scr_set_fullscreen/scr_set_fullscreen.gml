/// Set the window to the given value of fullscreen
function scr_set_fullscreen(_val)
{
	//update camera controller variable
	Camera_Controller.cur_fullscreen = _val;
	
	if(_val){ window_set_fullscreen(true); }
	else 
	{ 
		window_set_fullscreen(false);	
		//centre window if not fullscreen
		Camera_Controller.alarm[0] = 1;	
	}
}
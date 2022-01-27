function scr_resoloution()
{
	switch(cur_resoloution)
	{
		case 0:	
			window_set_fullscreen(false);
			window_set_size(1920,1080);	
			break;
		case 1:
			window_set_fullscreen(true);
			window_set_size(3840,2160);	
			break;
	}
	
}
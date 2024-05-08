/// Given an aspect ratio as a string return the view size for the camera
function scr_aspect_ratio_to_view_size(_aspect_ratio)
{
	var _view_width = 0;
	var _view_height = 0;
	
	
	switch(_aspect_ratio)
	{
		case "4:3":
			_view_width = 640;
			_view_height = 480;
			break;
		case "16:9":
			_view_width = 640;
			_view_height = 360;
			break;
		case "43:18":
			_view_width = 1075;
			_view_height = 450;
			break;
	}
	
	var _ret =  [_view_width,_view_height];
	return _ret;
}
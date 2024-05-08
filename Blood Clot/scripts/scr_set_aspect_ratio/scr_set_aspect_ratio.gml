/// Set the view size of the camera (Aspect Ratio) to the given ratio
function scr_set_aspect_ratio(_aspect_ratio)
{
	var _view_width;
	var _view_height;
	
	//get the required view size given an aspect ratio
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
	
	var _cur_camera = Camera_Controller.cur_active_camera;
	
	//update the cameras view variables
	_cur_camera.view_width = _view_width
	_cur_camera.view_height = _view_height
	
	//update the camera controllers view variables
	Camera_Controller.view_width = _view_width;
	Camera_Controller.view_height = _view_height;
}
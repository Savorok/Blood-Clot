/// Set the view size of the camera (Aspect Ratio) to the given ratio
function scr_set_aspect_ratio(_aspect_ratio_string)
{
	var _aspect_ratio = scr_aspect_ratio_to_view_size(_aspect_ratio_string);
	var _view_width = _aspect_ratio[0];
	var _view_height = _aspect_ratio[1];
	
	var _cur_camera = Camera_Controller.cur_active_camera;
	
	//update the cameras view variables
	_cur_camera.view_width = _view_width
	_cur_camera.view_height = _view_height
	
	//update the camera controllers view variables
	Camera_Controller.view_width = _view_width;
	Camera_Controller.view_height = _view_height;
}
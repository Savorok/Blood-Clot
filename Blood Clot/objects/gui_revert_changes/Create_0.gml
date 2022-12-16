/// @description init revert changes

//get the centre of the screen
centre_x = Camera_Controller.window_width/2;
centre_y = Camera_Controller.window_height/2;

//set the gui size
display_set_gui_size(Camera_Controller.window_width,Camera_Controller.window_height)

//changes to revert to
prev_aspect_ratio = 0;
prev_resoloution = 0;
prev_fullscreen = 0;

//menu variables
mpos = 0;

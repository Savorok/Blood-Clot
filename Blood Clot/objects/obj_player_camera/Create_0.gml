///@description init camera variables

//view propertys
view_width = Camera_Controller.view_width;
view_height = Camera_Controller.view_height;

//follow propertys
x_to = x;
y_to = y;
pan_speed = 15;

follow = obj_player;

//shaking
shake_amount = Camera_Controller.shake_amount;

//zooming
zoom_w = Camera_Controller.zoom_w;
zoom_h = Camera_Controller.zoom_h;
max_zoom_width = Camera_Controller.max_zoom_width;
max_zoom_height = Camera_Controller.max_zoom_height;
return_time = Camera_Controller.return_time;

i = 0;

camera_set_view_size(view_camera[0],Camera_Controller.view_width,Camera_Controller.view_height);
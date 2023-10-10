///@description init camera variables

show_debug_message("I am Created");

//view propertys
view_width = Camera_Controller.view_width;
view_height = Camera_Controller.view_height;

//follow propertys
x_to = x;
y_to = y;
pan_speed = 15;

follow = obj_player;

//shaking
shake_amount = 10;
zoomed_shake_amount = 20;
can_shake = true;

//zooming
zoom_w = 25.6;
zoom_h = 14.4;
max_zoom_width = 128;
max_zoom_height = 72;
return_time = 2;

camera_set_view_size(view_camera[0],Camera_Controller.view_width,Camera_Controller.view_height);
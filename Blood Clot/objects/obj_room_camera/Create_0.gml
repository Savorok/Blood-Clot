/// @description init camera variables

//dev propertites
show_debug = false;

//view propertys
view_width = Camera_Controller.view_width;
view_height = Camera_Controller.view_height;

//follow properties
x_to = x;
y_to = y;
zoom_speed = 5;

follow = obj_room_camera;

camera_set_view_size(view_camera[0],Camera_Controller.view_width,Camera_Controller.view_height);
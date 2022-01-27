///@description Init camera variables

//view and window sizes
view_width = 640;
view_height = 360;
window_width = 1920;
window_height = 1080;

h_view_speed = 15; 
v_view_speed = 15;
h_camera_border = 240;
v_camera_border = 120;


//shaking
shake_amount = 10;
shaking = false;

//zooming
zoom = false;

zoom_w = 25.6;
zoom_h = 14.4;
max_zoom_width = 128;
max_zoom_height = 72;
return_time = 2;

//set window size
window_set_size(window_width,window_height);

//centre window
alarm[0] = 1;

//resize surface
surface_resize(application_surface,window_width,window_height)


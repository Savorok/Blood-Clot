/// @description inti camera menu variables

menu_width = 250;
menu_height = 300;
scale = 2;

//aspect ratios
aspect_ratios = ["4:3","16:9","43:18"];
cur_aspect_ratio = 0;

//resoloutions
resoloutions = 
[
	["640*480","800*600","1920*1440"],
	["1280*720","1920*1080","3840*2160"],
	["860*360","1720*720","3440*1440"]
];
cur_resoloution = 0;

//fullscreen
fullscreen = 0;

//get window and view size
win_w = Camera_Controller.window_width;
win_h = Camera_Controller.window_height;
view_w = Camera_Controller.view_width;
view_h = Camera_Controller.view_height;

//paning
pan_speed = obj_player_camera.pan_speed;

//shaking
shake_amount = obj_player_camera.shake_amount;
zoomed_shake_amount = obj_player_camera.zoomed_shake_amount;
can_shake = obj_player_camera.can_shake;

//zooming
zoom_w = obj_player_camera.zoom_w;
zoom_h = obj_player_camera.zoom_h;
max_zoom_width = obj_player_camera.max_zoom_width;
max_zoom_height = obj_player_camera.max_zoom_height;
return_time = obj_player_camera.return_time;
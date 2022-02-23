/// @description 

menu_width = 250;
menu_height = 300;
scale = 2;

aspect_ratios = ["4:3","16:9","43:18"];
cur_aspect_ratio = 0;
resoloutions = ["1280*720","1920*1080","3840*2160"];
cur_resoloution = 0;
fullscreen = 0;



resoloutions = 
[
	["640*480","800*600","1920*1440"],
	["1280*720","1920*1080","3840*2160"],
	["860*360","1720*720","3440*1440"]
];

//get window and view size
win_w = Camera_Controller.window_width;
win_h = Camera_Controller.window_height;
view_w = Camera_Controller.view_width;
view_h = Camera_Controller.view_height;
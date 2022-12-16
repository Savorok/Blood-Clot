/// @description Insert description here
mpos = 0;
option_offset_y = 35;
bracket_offset = 5;
arrow_offset = 20;

display_set_gui_size(Camera_Controller.window_width,Camera_Controller.window_height)

centre_x = window_get_width()/2;
centre_y = window_get_height()/2;

//aspect ratio
aspect_ratios = ["4:3","16:9","43:18"];
cur_aspect_ratio = Camera_Controller.cur_aspect_ratio;

//resoloution
resoloutions = 
[
	["640*480","800*600","1920*1440"],
	["1280*720","1920*1080","3840*2160"],
	["860*360","1720*720","3440*1440"]
];
cur_resoloution = Camera_Controller.cur_resoloution;

//fullscreen
fullscreen = ["No","Yes"];
cur_fullscreen = Camera_Controller.cur_fullscreen;
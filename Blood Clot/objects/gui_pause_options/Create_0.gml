/// @description Insert description here
mpos = 0;
option_offset_y = 35;
bracket_offset = 5;
arrow_offset = 20;

//aspect ratio
aspect_ratios = ["4:3","16:9","43:18"];
cur_aspect_ratio = Camera_Controller.cur_aspect_ratio-1;

//resoloution
resoloutions = 
[
	["640*480","800*600","1920*1440"],
	["1280*720","1920*1080","3840*2160"],
	["860*360","1720*720","3440*1440"]
];
cur_resoloution = Camera_Controller.cur_resoloution-1;

//fullscreen
fullscreen = ["No","Yes"];
cur_fullscreen = Camera_Controller.cur_fullscreen;
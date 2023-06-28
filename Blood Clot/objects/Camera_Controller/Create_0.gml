///@description Init camera variables

//get prefrences from options file
prefs = scr_get_display_pref();

for(i = 0; i < array_length(prefs); i++)
{
	show_debug_message("Pref:" + string(prefs[i]));
}

//view and window sizes
window_width = prefs[1];
window_height = prefs[2]
view_width = prefs[4]
view_height = prefs[5]


cur_aspect_ratio = prefs[0];
cur_resoloution = prefs[3]
cur_fullscreen = prefs[6]
cur_active_camera = obj_menu_camera;

//shaking
shaking = false;
//zooming
zoom = false;

//gui
gui_scale = 1;

//if player exists and no camera make one
alarm[2] = 1;

//set window size
window_set_size(window_width,window_height);

//centre window
alarm[0] = 1;

//resize surface
surface_resize(application_surface,window_width,window_height)

//set fullscreen
window_set_fullscreen(cur_fullscreen);
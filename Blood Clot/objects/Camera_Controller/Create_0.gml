///@description Init camera variables

//macros for interacting with view via gui
#macro mouse_gui_x device_mouse_x_to_gui(0)
#macro mouse_gui_y device_mouse_y_to_gui(0)

//get prefrences from options file
prefs = scr_get_display_pref();

//show prefs
/*
for(i = 0; i < array_length(prefs); i++)
{
	show_debug_message("Pref:" + string(prefs[i]));
}
*/

//view and window sizes
window_width = prefs[1];
window_height = prefs[2];
view_width = prefs[4];
view_height = prefs[5];

cur_aspect_ratio = prefs[0];
cur_resoloution = prefs[3];
cur_fullscreen = prefs[6];
gui_scale = prefs[7];

cur_active_camera = obj_menu_camera;

//shaking
shaking = false;
//zooming
zoom = false;

//gui
//gui_scale = 2;

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
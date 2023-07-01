/// @description init menu variables

mpos = 0; //current menu pos
menu_mode = 1; // check if the user is using mouse or keyboard input 0=mouse, 1=keyboard

//variables for mouuse controll
#macro mouse_gui_x device_mouse_x_to_gui(0)
#macro mouse_gui_y device_mouse_y_to_gui(0)
mx = mouse_gui_x;
my = mouse_gui_y;

//get camera controller refrences 
centre_x = Camera_Controller.window_width/2;
centre_y = Camera_Controller.window_height/2;
gui_scale = Camera_Controller.gui_scale;

//offset for buttons
button_offset = 40*gui_scale;



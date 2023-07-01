/// @description initialise main menu

mpos = 0; //current menu pos
menu_mode = 1; // check if the user is using mouse or keyboard input 0=mouse, 1=keyboard

//variables for mouse controll
mx = mouse_x;
my = mouse_y;

//get camera controller refreances
width = Camera_Controller.window_width;
height = Camera_Controller.window_height;
gui_scale = Camera_Controller.gui_scale;

//offset between buttons based on gui size
button_offset = 50*gui_scale;

//array of the buttons
menu_buttons = []; 

//create the buttons 
menu_buttons[0] = instance_create_layer(width/2, height/2,"Instances",obj_new_game);
menu_buttons[1] = instance_create_layer(width/2, height/2 + button_offset,"Instances",obj_continue);
menu_buttons[2] = instance_create_layer(width/2, height/2 + 2*button_offset,"Instances",obj_level_select);
menu_buttons[3] = instance_create_layer(width/2, height/2 + 3*button_offset,"Instances",obj_level_editor);
menu_buttons[4] = instance_create_layer(width/2, height/2 + 4*button_offset,"Instances",obj_bonus);
menu_buttons[5] = instance_create_layer(width/2, height/2 + 5*button_offset,"Instances",obj_settings);
menu_buttons[6] = instance_create_layer(width/2, height/2 + 6*button_offset,"Instances",obj_quit);

//scale with gui size
for(i = 0; i < array_length(menu_buttons); i++)
{
	menu_buttons[i].image_xscale = gui_scale;	
	menu_buttons[i].image_yscale = gui_scale;
}


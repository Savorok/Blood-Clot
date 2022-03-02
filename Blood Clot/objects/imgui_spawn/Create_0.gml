/// @description 

menu_width = 570;
menu_height = 300;
scale = 2;

draw_grid = true;
grid_colour = make_color_rgb(255,0,0);
grid_alpha = 1;
show_debug_masks = false;

//blood
cur_particle = "None";
particle_amount = 1;
paint_colours = ["Red","Orange","Yellow","Green","Blue","Indigo","Violet"];
paint_colour_num = 0;

//bonus
cur_spawn = "None";
delete_mode = false;
spawn_x = floor(mouse_x/16)*16;
spawn_y = floor(mouse_y/16)*16;

//spawn button colours
arr_size = 13;
button_colours = array_create(arr_size,0);
but_col_pos = 0;
active_button_colour = c_green;
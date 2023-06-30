/// @description draw pause menu

//var centre_x = Camera_Controller.window_width/2;
//var centre_y = Camera_Controller.window_height/2;

//draw backround
draw_set_color(c_black);
draw_set_alpha(.5);
draw_rectangle(0,0,centre_x*2,centre_y*2,false);
	
//draw pause menu text
draw_set_alpha(1);
draw_sprite_ext(spr_pause_box,image_index,centre_x,centre_y,2*(Camera_Controller.gui_scale),2*(Camera_Controller.gui_scale),image_angle,image_blend,image_alpha)

#macro mouse_gui_x device_mouse_x_to_gui(0)
#macro mouse_gui_y device_mouse_y_to_gui(0)

//draw continue
draw_sprite_ext(spr_pause_continue,0,centre_x,centre_y-(3*option_offset_y),1,1,image_angle,image_blend,image_alpha)

if(point_in_rectangle(mouse_gui_x,mouse_gui_y,
centre_x-sprite_get_width(spr_pause_continue)/2,
centre_y-(3*option_offset_y),
centre_x+sprite_get_width(spr_pause_continue)/2,
centre_y-(3*option_offset_y)+sprite_get_height(spr_pause_continue),
))
{
	show_debug_message("Here");	
}
else
{
		show_debug_message("no");	
}

/*
draw_set_font(fnt_gui_12);
draw_set_color(c_white);
draw_text(centre_x-52,centre_y-(3*option_offset_y),"Continue");
draw_text(centre_x-50,centre_y-(2*option_offset_y),"Restart");
draw_text(centre_x-46,centre_y-(1*option_offset_y),"Options");
draw_text(centre_x-58,centre_y,"Main Menu");
draw_text(centre_x-58,centre_y+(1*option_offset_y),"Exit Game");
*/

//draw version number
draw_set_color(c_gray);
draw_set_font(fnt_gui_10);
draw_text(centre_x-130,centre_y+130,"Ver: " + string(Global_Controller.version));

/*
//draw menu position
//continue
draw_set_color(c_white);
if(mpos == 0)
{
	draw_text(centre_x - 70, centre_y - (3*option_offset_y) + bracket_offset,"[");
	draw_text(centre_x + 70, centre_y - (3*option_offset_y) + bracket_offset,"]");
}
// restart
if(mpos == 1)
{
	draw_text(centre_x - 66, centre_y - (2*option_offset_y) + bracket_offset,"[");
	draw_text(centre_x + 66, centre_y - (2*option_offset_y) + bracket_offset,"]");
}
//options
else if(mpos == 2)
{
	draw_text(centre_x - 60, centre_y - (1*option_offset_y) + bracket_offset,"[");
	draw_text(centre_x + 60, centre_y - (1*option_offset_y) + bracket_offset,"]");
}
//main menu
else if(mpos == 3)
{
	draw_text(centre_x - 75, centre_y + bracket_offset,"[") ;
	draw_text(centre_x + 75, centre_y + bracket_offset,"]");
}
//exit game
else if(mpos == 4)
{
	draw_text(centre_x - 75, centre_y + (1*option_offset_y) + bracket_offset,"[");
	draw_text(centre_x + 75, centre_y + (1*option_offset_y) + bracket_offset,"]");
}
*/
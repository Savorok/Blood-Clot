/// @description draw pause menu

//draw backround
draw_set_color(c_black);
draw_set_alpha(.5);
draw_rectangle(0,0,centre_x*2,centre_y*2,false);
	
//draw pause menu text
draw_set_alpha(1);
draw_sprite_ext(spr_end_level,image_index,centre_x,centre_y,2,2,image_angle,image_blend,image_alpha)
draw_set_font(fnt_gui_12);
draw_set_color(c_white);
if(Level_Controller.minutes < 10)
{
	draw_text(centre_x-68,centre_y - (2*option_offset_y),"Time - 0" + string(Level_Controller.minutes) + ":" + string(Level_Controller.seconds));
}
else
{
	draw_text(centre_x-68,centre_y - (2*option_offset_y),"Time - " + string(Level_Controller.minutes) + ":" + string(Level_Controller.seconds));
}
draw_text(centre_x-68,centre_y - (1*option_offset_y),"Next Level");
draw_text(centre_x-38,centre_y,"Review");
draw_text(centre_x-58,centre_y + (1*option_offset_y),"Exit Game");

//draw version number
draw_set_color(c_gray);
draw_set_font(fnt_gui_10);
draw_text(centre_x-130,centre_y+130,"Ver: " + string(Global_Controller.version));

//draw menu position
//continue
draw_set_color(c_white);
if(mpos == 0)
{
	draw_text(centre_x - 80, centre_y - (1*option_offset_y) + bracket_offset,"[");
	draw_text(centre_x + 80, centre_y - (1*option_offset_y) + bracket_offset,"]");
}
// restart
if(mpos == 1)
{
	draw_text(centre_x - 60, centre_y  + bracket_offset,"[");
	draw_text(centre_x + 60, centre_y  + bracket_offset,"]");
}
//exit game
else if(mpos == 2)
{
	draw_text(centre_x - 75, centre_y + (1*option_offset_y) + bracket_offset,"[");
	draw_text(centre_x + 75, centre_y + (1*option_offset_y) + bracket_offset,"]");
}
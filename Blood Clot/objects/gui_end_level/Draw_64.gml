/// @description draw pause menu

//draw backround
draw_set_color(c_black);
draw_set_alpha(.5);
draw_rectangle(0,0,window_get_width(),window_get_height(),false);
	
//pause menu offsets
var centre_x = surface_get_width(application_surface)/2;
var centre_y = surface_get_height(application_surface)/2;
	
//draw pause menu text
draw_set_alpha(1);
draw_sprite_ext(spr_end_level,image_index,centre_x,centre_y,2,2,image_angle,image_blend,image_alpha)
draw_set_font(fnt_timer_12);
draw_set_color(c_white);
draw_text(centre_x-68,centre_y-(2*option_offset_y),"Next Level");
draw_text(centre_x-38,centre_y-(1*option_offset_y),"Review");
draw_text(centre_x-58,centre_y,"Exit Game");

//draw version number
draw_set_color(c_gray);
draw_set_font(fnt_timer_10);
draw_text(centre_x-130,centre_y+130,"Ver: " + string(Global_Controller.version));

//draw menu position
//continue
draw_set_color(c_white);
if(mpos == 0)
{
	draw_text(centre_x - 80, centre_y - (2*option_offset_y) + bracket_offset,"[");
	draw_text(centre_x + 80, centre_y - (2*option_offset_y) + bracket_offset,"]");
}
// restart
if(mpos == 1)
{
	draw_text(centre_x - 60, centre_y - (1*option_offset_y) + bracket_offset,"[");
	draw_text(centre_x + 60, centre_y - (1*option_offset_y) + bracket_offset,"]");
}
//exit game
else if(mpos == 2)
{
	draw_text(centre_x - 75, centre_y + bracket_offset,"[");
	draw_text(centre_x + 75, centre_y + bracket_offset,"]");
}
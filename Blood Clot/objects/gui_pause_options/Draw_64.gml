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
draw_sprite_ext(spr_pause_options,image_index,centre_x,centre_y,2,2,image_angle,image_blend,image_alpha)
draw_set_font(fnt_timer_12);
draw_set_color(c_white);
draw_text(centre_x-140,centre_y-(3*option_offset_y),"Resoloution:");
draw_text(centre_x+40,centre_y-(3*option_offset_y),"1920x1080");
draw_text(centre_x-130,centre_y-(2*option_offset_y),"Fullscreen:");
draw_text(centre_x+40,centre_y-(2*option_offset_y),"Yes");
draw_text(centre_x-110,centre_y-(1*option_offset_y),"Gui Scale:");
draw_text(centre_x+25,centre_y-(1*option_offset_y),"1");
draw_text(centre_x-58,centre_y+(1*option_offset_y),"Apply");

//draw menu position
//resoloution
draw_set_color(c_white);
if(mpos == 0)
{
	draw_text(centre_x - 160, centre_y - (3*option_offset_y) + bracket_offset,"[");
	draw_text(centre_x - 30, centre_y - (3*option_offset_y) + bracket_offset,"<");
	draw_text(centre_x + 160, centre_y - (3*option_offset_y) + bracket_offset,">]");
}
// Fullscreen
if(mpos == 1)
{
	draw_text(centre_x - 66, centre_y - (2*option_offset_y) + bracket_offset,"[");
	draw_text(centre_x + 66, centre_y - (2*option_offset_y) + bracket_offset,"]");
}
//Gui Scale
else if(mpos == 2)
{
	draw_text(centre_x - 60, centre_y - (1*option_offset_y) + bracket_offset,"[");
	draw_text(centre_x + 60, centre_y - (1*option_offset_y) + bracket_offset,"]");
}
//Apply
else if(mpos == 3)
{
	draw_text(centre_x - 75, centre_y + bracket_offset,"[") ;
	draw_text(centre_x + 75, centre_y + bracket_offset,"]");
}

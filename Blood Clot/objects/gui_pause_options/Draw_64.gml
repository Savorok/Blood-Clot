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
draw_text(centre_x-140,centre_y-(3*option_offset_y),"Aspect Ratio:");
draw_text(centre_x+65,centre_y-(3*option_offset_y),aspect_ratios[cur_aspect_ratio]);
draw_text(centre_x-140,centre_y-(2*option_offset_y),"Resoloution:");
if(cur_resoloution == 0)
{
	draw_text(centre_x+45,centre_y-(2*option_offset_y),resoloutions[0,cur_resoloution]);
}
else if(cur_resoloution == 1)
{
	draw_text(centre_x+45,centre_y-(2*option_offset_y),resoloutions[1,cur_resoloution]);
}
else if(cur_resoloution == 2)
{
	draw_text(centre_x+45,centre_y-(2*option_offset_y),resoloutions[2,cur_resoloution]);
}
draw_text(centre_x-130,centre_y-(1*option_offset_y),"Fullscreen:");
draw_text(centre_x+70,centre_y-(1*option_offset_y),fullscreen[cur_fullscreen]);
draw_text(centre_x-110,centre_y,"Gui Scale:");
draw_text(centre_x+50,centre_y,"1");
draw_text(centre_x-20,centre_y+(3*option_offset_y),"Apply");

//draw menu position
//aspect ratio
draw_set_color(c_white);
if(mpos == 0)
{
	draw_sprite_ext(spr_arrow,image_index,centre_x + 50,centre_y - (3*option_offset_y) + arrow_offset,-1,1,image_angle,image_blend,image_alpha);
	draw_sprite_ext(spr_arrow,image_index,centre_x + 130,centre_y - (3*option_offset_y) + arrow_offset,1,1,image_angle,image_blend,image_alpha);
}
//resoloution
if(mpos == 1)
{
	draw_sprite_ext(spr_arrow,image_index,centre_x + 30,centre_y - (2*option_offset_y) + arrow_offset,-1,1,image_angle,image_blend,image_alpha);
	draw_sprite_ext(spr_arrow,image_index,centre_x + 160,centre_y - (2*option_offset_y) + arrow_offset,1,1,image_angle,image_blend,image_alpha);
}
//fullscreen
else if(mpos == 2)
{
	draw_sprite_ext(spr_arrow,image_index,centre_x + 20,centre_y - (1*option_offset_y) + arrow_offset,-1,1,image_angle,image_blend,image_alpha);
	draw_sprite_ext(spr_arrow,image_index,centre_x + 70,centre_y - (1*option_offset_y) + arrow_offset,1,1,image_angle,image_blend,image_alpha);
}
//Gui size
else if(mpos == 3)
{
	draw_sprite_ext(spr_arrow,image_index,centre_x + 20,centre_y + arrow_offset,-1,1,image_angle,image_blend,image_alpha);
	draw_sprite_ext(spr_arrow,image_index,centre_x + 70,centre_y + arrow_offset,1,1,image_angle,image_blend,image_alpha);
}
//Apply
else if(mpos == 4)
{
	draw_text(centre_x - 40, centre_y + (3*option_offset_y) + bracket_offset,"[") ;
	draw_text(centre_x + 60, centre_y + (3*option_offset_y) + bracket_offset,"]");
}

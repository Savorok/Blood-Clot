/// @description draw pause menu

//var centre_x = Camera_Controller.window_width/2;
//var centre_y = Camera_Controller.window_height/2;

//draw backround
draw_set_color(c_black);
draw_set_alpha(.5);
draw_rectangle(0,0,centre_x*2,centre_y*2,false);
	
show_debug_message("Window Width: " + string(window_get_width()));
show_debug_message("Window Height: " + string(window_get_height()));
show_debug_message("Controller Width: " + string(Camera_Controller.window_width));
show_debug_message("Controller Height: " + string(Camera_Controller.window_height));
show_debug_message("Centre X: " + string(centre_x));
show_debug_message("Centre Y: " + string(centre_y));

	
//draw pause menu text
draw_set_alpha(1);
draw_sprite_ext(spr_pause_options,image_index,centre_x,centre_y,2,2,image_angle,image_blend,image_alpha)
draw_set_font(fnt_timer_12);
draw_set_color(c_white);
draw_text(centre_x-140,centre_y-(3*option_offset_y),"Aspect Ratio:");
draw_text(centre_x+65,centre_y-(3*option_offset_y),aspect_ratios[cur_aspect_ratio]);
draw_text(centre_x-140,centre_y-(2*option_offset_y),"Resoloution:");
if(cur_aspect_ratio == 0)
{
	draw_text(centre_x+45,centre_y-(2*option_offset_y),resoloutions[0,cur_resoloution]);
}
else if(cur_aspect_ratio == 1)
{
	draw_text(centre_x+45,centre_y-(2*option_offset_y),resoloutions[1,cur_resoloution]);
}
else if(cur_aspect_ratio == 2)
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
	draw_text(centre_x - 40, centre_y + (3*option_offset_y) + bracket_offset,"[");
	draw_text(centre_x + 60, centre_y + (3*option_offset_y) + bracket_offset,"]");
}
/// @description Draw Timer

if(!level_complete)
{
	//draw on the player instance level
	depth = -600
	
	var xx = view_get_xport(view_camera[0]);//x pot
	var yy = view_get_yport(view_camera[0]);//y pot

	draw_set_font(fnt_timer_12);
	draw_set_color(c_white);//draw in black
	draw_set_alpha(1);

	draw_sprite_ext(spr_time_box,sprite_index,xx+gui_xoff,yy+gui_yoff,2,2,image_angle,image_blend,image_alpha)
	//draw gui

	//draw 0 to make a 00:00 clock
	draw_set_alpha(1);
	if(seconds < 10) and (minutes < 10)
	{
		draw_text(xx+time_xoff,yy+time_yoff,"0" + string(minutes) + ":0" + string(seconds))
	}
	else if (seconds >= 10) and (minutes >= 10)
	{
		draw_text(xx+time_xoff,yy+time_yoff,string(minutes) + ":" + string(seconds))
	}
	else if (seconds < 10) and (minutes >= 10)
	{
		draw_text(xx+time_xoff,yy+time_yoff,string(minutes) + ":0" + string(seconds))
	}
	else if (seconds >= 10) and (minutes < 10)
	{
		draw_text(xx+time_xoff,yy+time_yoff,"0" + string(minutes) + ":" + string(seconds))
	}
}



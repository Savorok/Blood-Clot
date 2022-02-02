/// @description Draw pause

//draw pause
if(paused)
{
	draw_set_alpha(0.5);
	draw_set_color(c_black);
	draw_rectangle(0,0,window_get_width(),window_get_height(),0);
	draw_set_alpha(1);
}


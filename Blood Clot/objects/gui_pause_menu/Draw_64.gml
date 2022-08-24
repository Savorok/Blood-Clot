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
draw_sprite_ext(spr_pause_box,image_index,centre_x,centre_y,2,2,image_angle,image_blend,image_alpha)
draw_set_font(fnt_timer_12);
draw_set_color(c_white);
draw_text(centre_x-60,centre_y-110,"Continue");
draw_text(centre_x-55,centre_y-70,"Restart");
draw_text(centre_x-58,centre_y-30,"Options");
draw_text(centre_x-65,centre_y+10,"Main Menu");
draw_text(centre_x-65,centre_y+50,"Exit Game");

//draw version number
draw_set_color(c_gray);
draw_set_font(fnt_timer_10);
draw_text(centre_x-130,centre_y+130,"Ver: " + string(Global_Controller.version));

//draw menu position
//continue
draw_set_color(c_white);
if(mpos == 0)
{
	draw_text(centre_x - 100, centre_y - 110,"[");
	draw_text(centre_x + 80, centre_y - 110,"]");
}
// restart
if(mpos == 1)
{
	draw_text(centre_x - 100, centre_y -70,"[");
	draw_text(centre_x + 80, centre_y -70,"]");
}
//options
else if(mpos == 2)
{
	draw_text(centre_x - 90, centre_y -30 ,"[");
	draw_text(centre_x + 70, centre_y -30 ,"]");
}
//main menu
else if(mpos == 3)
{
	draw_text(centre_x - 120, centre_y +10,"[");
	draw_text(centre_x + 90, centre_y +10,"]");
}
//exit game
else if(mpos == 4)
{
	draw_text(centre_x - 120, centre_y +50,"[");
	draw_text(centre_x + 100, centre_y +50,"]");
}
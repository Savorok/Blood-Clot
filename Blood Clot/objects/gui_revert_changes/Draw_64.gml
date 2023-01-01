/// @description draw the sprite and text

//draw a backround over the previous one
draw_set_color(c_black);
draw_set_alpha(.5);
draw_rectangle(0,0,centre_x*2,centre_y*2,false);

//set depth to be above current gui layer
depth = -1000;

//draw the sprite and text
draw_set_alpha(1);
draw_sprite_ext(spr_revert_changes,image_index,centre_x,centre_y,2,2,image_angle,image_blend,image_alpha)
draw_set_font(fnt_gui_12);
draw_set_color(c_white);
draw_text(centre_x-70,centre_y,"Yes");
draw_text(centre_x+40,centre_y,"No");

//draw brackets
if(mpos = 0)
{
	draw_text(centre_x - 90, centre_y,"[");
	draw_text(centre_x - 10, centre_y,"]");
}
else if(mpos = 1)
{
	draw_text(centre_x + 20, centre_y,"[");
	draw_text(centre_x + 80, centre_y,"]");
}
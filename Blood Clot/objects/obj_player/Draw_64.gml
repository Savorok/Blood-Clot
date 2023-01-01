/// @description Draw player gui

//draw on the player instance level
depth = -600

//get an updated Gui size
scale = 3 * (Camera_Controller.gui_scale);

//draw healthbar
draw_sprite_ext(spr_backround_health_bar,0,healthbar_x,healthbar_y,scale,scale,0,c_white,1);
draw_sprite_stretched(spr_inner_health_bar,0,healthbar_x,healthbar_y,(cur_blood/max_blood) * healthbar_width * scale,healthbar_height * scale)
draw_sprite_ext(spr_outer_health_bar,0,healthbar_x,healthbar_y,scale,scale,0,c_white,1);
draw_set_font(Font2);
draw_set_color(c_black);
draw_text(healthbar_x + healthbar_width/2,healthbar_y + healthbar_height/2, string(cur_blood) + "/" + string(max_blood))

//draw player bleeds
if(bleeds > 0)
{
	draw_sprite_ext(spr_bleed_icon,0,bleed_icon_x,bleed_icon_y,scale,scale,0,-1,1);
	draw_set_color(c_black);
	draw_set_font(Font2);
	draw_text(bleed_number_x,bleed_number_y,"x" + string(bleeds));
	draw_text(bleed_sec_x, bleed_sec_y,string(bleed_per_sec*60) + " bleed/s")
}

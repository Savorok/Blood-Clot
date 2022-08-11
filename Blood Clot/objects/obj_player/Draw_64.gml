/// @description Draw player gui
if(bleeds > 0)
{
	draw_sprite_ext(spr_bleed_icon,0,10,10,3,3,0,-1,1);
	draw_set_color(c_black);
	draw_set_font(font1);
	draw_text(55,10,bleeds)
}
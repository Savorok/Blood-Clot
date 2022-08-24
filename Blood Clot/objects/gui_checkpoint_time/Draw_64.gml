/// @description 
draw_sprite_ext(spr_checkpoint_time,1,x,y+17,2,2,image_angle,image_blend,image_alpha)
draw_set_font(fnt_timer_10);
draw_set_color(c_white);
draw_text(x+4,y+12,string(num) + " ~ " + string(time));
image_alpha -= fade;
if(image_alpha <= 0)
{
	instance_destroy();	
}
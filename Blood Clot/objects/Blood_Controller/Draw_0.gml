/// @description Draw surface
if(!surface_exists(surface_blood))
{
	surface_blood = surface_create(room_width,room_height);
}
else
{
	draw_set_alpha(1);
	draw_surface(surface_blood,0,0);
}

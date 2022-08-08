//init variables
show_debug_message(image_angle)
if(abs(image_angle) == 90)
{
	instance_create_depth(x, y-8,1,obj_saw_blade);
}
else if (abs(image_angle) ==180)
{
	instance_create_depth(x-image_xscale*16+8, y,1,obj_saw_blade);
}
else if (abs(image_angle) == 270)
{
	instance_create_depth(x, y+image_xscale*16-8,1,obj_saw_blade);
}
else if (abs(image_angle) == 360)
{
	instance_create_depth(x+8, y,1,obj_saw_blade);
}








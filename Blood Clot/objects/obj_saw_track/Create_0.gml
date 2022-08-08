//init variables
if(abs(image_angle) == 90 || (abs(image_angle) == 270))
{
	instance_create_depth(x, y-8,1,obj_saw_blade);
}
else
{
	instance_create_depth(x+8, y,1,obj_saw_blade);
}







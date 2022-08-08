//init variables
spd = 0.5; //speed of the blade
length = image_xscale*16 //length of track in pixels
edge_buffer = 8; //number of pixels to stop short of the edge

var saw;
if(abs(image_angle) == 90)
{	
	saw = instance_create_depth(x, y-8,1,obj_saw_blade);
}
else if (abs(image_angle) ==180)
{
	saw = instance_create_depth(x-image_xscale*16+8, y,1,obj_saw_blade);
}
else if (abs(image_angle) == 270)
{
	saw = instance_create_depth(x, y+image_xscale*16-8,1,obj_saw_blade);
}
else if (abs(image_angle) == 360 || image_angle == 0)
{
	saw = instance_create_depth(x+8, y,1,obj_saw_blade);
}

saw.length = length
saw.spd = spd + random_range(0.1,1)
saw.edge_buffer = edge_buffer




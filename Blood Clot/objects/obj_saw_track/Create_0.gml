//init variables
spd = 0.5; //speed of the blade
length = image_xscale*16 //length of track in pixels
edge_buffer = 8; //number of pixels to stop short of the edge
angle = image_angle;


if(angle == 90)
{	
	saw = instance_create_depth(x, y-8,1,obj_saw_blade);
}
else if (abs(angle) ==180)
{
	saw = instance_create_depth(x-length+8, y,1,obj_saw_blade);
}
else if (angle == -90)
{
	saw = instance_create_depth(x, y+length-8,1,obj_saw_blade);
}
else if (abs(angle) == 360 || angle == 0)
{
	saw = instance_create_depth(x+8, y,1,obj_saw_blade);
}

saw.track_length = length
saw.spd = spd + random_range(0.1,1)
saw.edge_buffer = edge_buffer
saw.angle = angle;




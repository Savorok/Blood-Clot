//set dpeth 
depth = -300

//init variables
spd = 0.5; //speed of the blade
length = obj_saw_track.image_xscale*16 //length of track in pixels
edge_buffer = 8; //number of pixels to stop short of the edge
start_x = x; //inital x pos
start_y = y; //initial y pos

//calc starting diretion
dir = ""
if(abs(obj_saw_track.image_angle) == 90 || (abs(obj_saw_track.image_angle) == 270))
{
	dir = "up";
}
else
{
	dir = "right";
}

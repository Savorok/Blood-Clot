//set dpeth 
depth = -300

//init variables
start_x = x; //inital x pos
start_y = y; //initial y pos
spd = 0;
length = 0;
edge_buffer = 0;

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

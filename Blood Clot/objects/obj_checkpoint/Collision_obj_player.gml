/// @description Activate
if(activated = false)
{
	//change to new sprite
	image_index = 1;
	image_speed = 0;
	visible = true;

	activated = true;//has activated

	//set new spawn
	Level_Controller.spawn_x = spawn_x;
	Level_Controller.spawn_y = spawn_y;
	
	//activate checkpoint gui time
	Level_Controller.alarm[2] = 20;
}
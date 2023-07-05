/// @description init spikes

//init variables
active = false;
activating = false;
activate_delay = 10;
deactivate_delay = 40;
deactivating = false;

//the spikes for this object
spikes = 0;

//get rotation
rot = image_angle

//up
if(rot == 0)
{
	spikes = instance_create_layer(x,y+16,"Instances",obj_spikes_up);
}
//right
else if(rot == -90)
{
	spikes = instance_create_layer(x-32,y,"Instances",obj_spikes_right);
}
//down
else if(abs(rot) == 180)
{
	spikes = instance_create_layer(x-16,y-32,"Instances",obj_spikes_down);
}
//left
else if(rot == 90)
{
	spikes = instance_create_layer(x+16,y-16,"Instances",obj_spikes_left);
}




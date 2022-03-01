if(spears > 0)
{
	spears --;
	ready = true;
	instance_create_layer(x,y+irandom(8),"Instances",obj_spear);
}
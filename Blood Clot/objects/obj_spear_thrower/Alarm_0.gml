if(spears > 0)
{
	spears --;
	ready = true;
	instance_create_depth(x,y+irandom(8),1,obj_spear);
}
/// @description Spawn finising ghost
if(level_complete)
{
	var _final_ghost = instance_create_layer(x,y,"Instances",obj_ghost);
	_final_ghost.actions = ghosts[array_length(ghosts)-1];
}
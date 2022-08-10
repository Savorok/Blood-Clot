/// @description heal 1 bleed
if(obj_player.bleeds > 0)
{
	obj_player.bleeds --;
}
instance_destroy();
scr_resoloution()

if(keyboard_check(ord("R")))
{
	room_restart();	
}

if(keyboard_check(ord("F")))
{
	game_end();	
}

if(instance_exists(obj_player))
{
	//show_debug_message(asset_get_index(object_get_sprite(obj_player)));
	show_debug_message(asset_get_index(spr_player));
	//show_debug_message(object_get_sprite(obj_player));
	//show_debug_message(asset_get_index(object_get_sprite(obj_player)));
	
}


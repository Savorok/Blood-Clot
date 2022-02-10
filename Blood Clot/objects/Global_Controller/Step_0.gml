
if(keyboard_check(ord("R")))
{
	room_restart();	
}

if(keyboard_check(ord("F")))
{
	game_end();	
}

if(keyboard_check_pressed(vk_up))
{
	if(cur_ratio == 2){cur_ratio = 0;}
	else{cur_ratio++;}
	show_debug_message("Ratio:" + string(cur_ratio));
}
if(keyboard_check_pressed(vk_left))
{
	if(fullscreen){fullscreen = false;}
	else{fullscreen = true;}
	show_debug_message("Fullscreen:" + string(fullscreen));
}
if(keyboard_check_pressed(vk_right))
{
	if(cur_resoloution == 2){cur_resoloution = 0;}
	else{cur_resoloution ++;}
	show_debug_message("Res:" + string(cur_resoloution));
}

if(keyboard_check_pressed(vk_down))
{
	scr_resoloution(cur_ratio,cur_resoloution,obj_player_camera,fullscreen);
}

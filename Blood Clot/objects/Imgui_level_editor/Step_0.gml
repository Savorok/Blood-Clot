/// @description make dev menu

//debug functionality
key_level_editor = keyboard_check_pressed(vk_f2);
if(key_level_editor and !level_editor){ level_editor = true; }
else if(key_level_editor and level_editor){ level_editor = false; }


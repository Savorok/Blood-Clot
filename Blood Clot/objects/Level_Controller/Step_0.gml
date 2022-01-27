
//pause functionality
key_pause = keyboard_check_pressed(vk_escape);

if(key_pause and !paused){ paused = true; }
else if(key_pause and paused){ paused = false; }

//debug functionality
key_debug = keyboard_check_pressed(vk_f1);

if(key_debug and !debug){ debug = true; }
else if(key_debug and debug){ debug = false; }
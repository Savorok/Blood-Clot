/// @description init room variables

free_cam = false;

room_friction = 0.5;
room_gravity = 0.3;

respawn_time = 20;
can_respawn = true;
spawn_x = 0;
spawn_y = 0;

paused = false; 
pause_blocked = false;
level_complete = false;

//shell variables
shell_open = false;
accept_input = true;

//clock variables
seconds = 0;
minutes = 0;

checkpoint_num = 0;
checkpoint_times = [];
checkpoint_times_gui_active = 0;

count_up = false; 

time_xoff = 38;
time_yoff = 0;
gui_xoff = 4;
gui_yoff = 4;

//ghost variables
ghost_enabled = false;
ghost_num = 0;
ghosts = [];

//generate level collisions
generating = true;
alarm[4] = 1;

//regenereate vars
re_gen = false;

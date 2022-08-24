/// @description add checkpoint time

if(minutes < 10){var time = "0" + string(minutes) + ":" + string(seconds);}
else{var time = string(minutes) + ":" + string(seconds);}

checkpoint_times[checkpoint_num] = time;
checkpoint_num++;
checkpoint_times_gui_active++;
var checkpoint = instance_create_layer(4,20,"Instances",gui_checkpoint_time);
checkpoint.num = checkpoint_times_gui_active;
checkpoint.time = time;



/// @description Init variables

#region movement variables

global.master_speed = 1.1;

//ground
ground_acc = 0.2;
ground_max_speed = 4.0;

global.ground_acc = ground_acc*global.master_speed;
global.ground_max_speed = ground_max_speed*global.master_speed;

//air
air_acc = 0.1;
air_fric = 0.005;
air_max_speed = 4;

global.air_acc = air_acc*global.master_speed;
global.air_fric = air_fric*global.master_speed;
global.air_max_speed = air_max_speed*global.master_speed;

//jump
jump_speed = -3.1;

global.jump_speed = jump_speed*global.master_speed


#endregion

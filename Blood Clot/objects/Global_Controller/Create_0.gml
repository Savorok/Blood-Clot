/// @description Init variables

#region movement variables

var master_speed = 1.1;

//ground
var ground_acc = 0.2;
var ground_max_speed = 4.0;

global.ground_acc = ground_acc*master_speed;
global.ground_max_speed = ground_max_speed*master_speed;

//air
var air_acc = 0.1;
var air_fric = 0.005;
var air_max_speed = 4;

global.air_acc = air_acc*master_speed;
global.air_fric = air_fric*master_speed;
global.air_max_speed = air_max_speed*master_speed;

//jump
var jump_speed = -3.1;

global.jump_speed = jump_speed*master_speed

///wall jumping
//away
global.h_jump_away = 1.1;
global.v_jump_away = 0.7;
//towards
global.h_jump_towards = 0.3;
global.v_jump_towards = 1.2;

#endregion


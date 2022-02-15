/// @description Init variables

#region movement variables

master_speed = 1.1;

#region ground

var ground_acc = 0.2;
var ground_max_speed = 4.0;

global.ground_acc = ground_acc*master_speed;
global.ground_max_speed = ground_max_speed*master_speed;

#endregion

#region air

var air_acc = 0.1;
var air_fric = 0.005;
var air_max_speed = 4;

global.air_acc = air_acc*master_speed;
global.air_fric = air_fric*master_speed;
global.air_max_speed = air_max_speed*master_speed;

#endregion

#region water

var water_acc = 0.05;
var water_fric = 0.05;
var water_max_speed = 2;
var water_gravity = 15;

global.water_acc = water_acc*master_speed;
global.water_fric = water_fric*master_speed;
global.water_max_speed = water_max_speed*master_speed;
global.water_gravity = water_gravity;

#endregion

#region blood

var blood_acc = 0.01;
var blood_fric = 0.1;
var blood_max_speed = 1.2;
var blood_gravity = 24;

global.blood_acc = blood_acc*master_speed;
global.blood_fric = blood_fric*master_speed;
global.blood_max_speed = blood_max_speed*master_speed;
global.blood_gravity = blood_gravity;

#endregion

#region jumping

//jump
var jump_speed = -3.1;
var water_jump_speed = -1.8;
var blood_jump_speed = -1.1;

global.jump_speed = jump_speed*master_speed
global.water_jump_speed = water_jump_speed*master_speed;
global.blood_jump_speed = blood_jump_speed*master_speed;

///wall jumping
//away
global.h_jump_away = 1.1;
global.v_jump_away = 0.7;
//towards
global.h_jump_towards = 0.3;
global.v_jump_towards = 1.2;

#endregion

#endregion

#region resoloution variables

cur_resoloution = 2;
cur_ratio = 1;
fullscreen = true;

#endregion

dev_mode = true;

if(dev_mode and !instance_exists(Imgui_Controller))
{
	instance_create_depth(x,y,depth,imgui);
	instance_create_depth(x,y,depth,Imgui_Controller);
} 
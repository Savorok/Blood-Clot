/// @description Init variables

#region movement variables

master_speed = 1.1;

#region ground

ground_acc = 0.2;
ground_max_speed = 4.0;

global.ground_acc = ground_acc*master_speed;
global.ground_max_speed = ground_max_speed*master_speed;

#endregion

#region air

air_acc = 0.1;
air_fric = 0.005;
air_max_speed = 4;

global.air_acc = air_acc*master_speed;
global.air_fric = air_fric*master_speed;
global.air_max_speed = air_max_speed*master_speed;

#endregion

#region water

water_acc = 0.05;
water_fric = 0.05;
water_max_speed = 2;
water_gravity = 15;
water_splash_modifier = 10;
can_slide_in_water = false;

global.water_acc = water_acc*master_speed;
global.water_fric = water_fric*master_speed;
global.water_max_speed = water_max_speed*master_speed;
global.water_gravity = water_gravity;
global.water_splash_modifier = water_splash_modifier;
global.can_slide_in_water = can_slide_in_water;

#endregion

#region blood

blood_acc = 0.01;
blood_fric = 0.1;
blood_max_speed = 1.2;
blood_gravity = 24;

global.blood_acc = blood_acc*master_speed;
global.blood_fric = blood_fric*master_speed;
global.blood_max_speed = blood_max_speed*master_speed;
global.blood_gravity = blood_gravity;

#endregion

#region jumping

//jump
jump_speed = -3.1;
water_jump_speed = -1.8;
blood_jump_speed = -1.1;

global.jump_speed = jump_speed*master_speed
global.water_jump_speed = water_jump_speed*master_speed;
global.blood_jump_speed = blood_jump_speed*master_speed;

///wall jumping
wall_jump_threshold = 1;
global.wall_jump_threshold = wall_jump_threshold;

//away
h_jump_a = 1.1;
v_jump_a = 0.7;
global.h_jump_away = h_jump_a;
global.v_jump_away = v_jump_a;
//towards
h_jump_t = 0.3;
v_jump_t = 1.2;
global.h_jump_towards = h_jump_t;
global.v_jump_towards = v_jump_t;

#endregion

#endregion

dev_mode = true;
version = "5.5.2";

if(dev_mode and !instance_exists(Imgui_dev_menu))
{
	instance_create_layer(x,y,"Controllers",imgui);
	instance_create_layer(x,y,"Controllers",Imgui_dev_menu);
	instance_create_layer(x,y,"Controllers",Imgui_level_editor);
	instance_create_layer(x,y,"Controllers",Imgui_console)
} 


/// @description 

menu_width = 570;
menu_height = 300;
scale = 2;

if(instance_exists(obj_finish))
{
	finish_x = obj_finish.x; 
	finish_y = obj_finish.y; 
}

default_spawn_x = Level_Controller.spawn_x;
default_spawn_y = Level_Controller.spawn_y;

#region movement variables
master_speed = Global_Controller.master_speed;

//level
level_fric = Level_Controller.room_friction;
level_grav = Level_Controller.room_gravity;

//ground
ground_acc = Global_Controller.ground_acc;
ground_max_speed = Global_Controller.ground_max_speed;
ground_jump = Global_Controller.jump_speed;

//air
air_acc = Global_Controller.air_acc;
air_max_speed = Global_Controller.air_max_speed;
air_fric =  Global_Controller.air_fric;

//water
water_acc = Global_Controller.water_acc;
water_fric = Global_Controller.water_fric;
water_max_speed = Global_Controller.water_max_speed;
water_gravity = Global_Controller.water_gravity;
water_jump_speed = Global_Controller.water_jump_speed

//blood
blood_acc = Global_Controller.blood_acc;
blood_fric = Global_Controller.blood_fric;
blood_max_speed = Global_Controller.blood_max_speed;
blood_gravity = Global_Controller.blood_gravity;
blood_jump_speed = Global_Controller.blood_jump_speed

//wall

h_jump_a = Global_Controller.h_jump_a;
v_jump_a = Global_Controller.v_jump_a;

h_jump_t = Global_Controller.h_jump_t;
v_jump_t = Global_Controller.v_jump_t;

#endregion

no_blood_loss = obj_player.no_blood_loss;
invincible = obj_player.invincible;
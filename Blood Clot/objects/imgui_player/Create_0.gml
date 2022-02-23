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

//movement variables
update_movement_variables = false;

//master_speed = Global_Controller.master_speed;

//level
//level_fric = Level_Controller.room_friction;
//level_grav = Level_Controller.room_gravity;

//ground
//ground_acc = Global_Controller.ground_acc;
//ground_max_speed = Global_Controller.ground_max_speed;
//ground_jump = Global_Controller.jump_speed;
#region update movement variables

//ground
global.ground_acc = ground_acc*master_speed;
global.ground_max_speed = ground_max_speed*master_speed;

//air
global.air_acc = air_acc*master_speed;
global.air_fric = air_fric*master_speed;
global.air_max_speed = air_max_speed*master_speed;

//water
global.water_acc = water_acc*master_speed;
global.water_fric = water_fric*master_speed;
global.water_max_speed = water_max_speed*master_speed;
global.water_gravity = water_gravity;
global.water_splash_modifier = water_splash_modifier;
global.can_slide_in_water = can_slide_in_water;

//blood
global.blood_acc = blood_acc*master_speed;
global.blood_fric = blood_fric*master_speed;
global.blood_max_speed = blood_max_speed*master_speed;
global.blood_gravity = blood_gravity;

//jump
global.jump_speed = jump_speed*master_speed
global.water_jump_speed = water_jump_speed*master_speed;
global.blood_jump_speed = blood_jump_speed*master_speed;
global.h_jump_away = h_jump_a;
global.v_jump_away = v_jump_a;
global.h_jump_towards = h_jump_t;
global.v_jump_towards = v_jump_t;
global.wall_jump_threshold = wall_jump_threshold;

#endregion

if(keyboard_check(ord("R")))
{
	//room_restart();	
}

if(keyboard_check(ord("F")))
{
	//game_end();	
}


///initialize player variables

//player properties
dead = false;
on_ground = false;
in_water = false;
in_blood = false;
holding_jump_key = false;

//health
cur_blood = 3000;
max_blood = 3000;
min_blood = 0;

//sprite propertys
x_scale = 1.0; 
y_scale = 1.0;
alpha = 1;

//movement variables 
h_speed = 0;
v_speed = 0;

//action hold variables
hold_time = 0;
max_hold_time = 50;

//stuck spears
stuck_spears = 0;
spear_pos = [];

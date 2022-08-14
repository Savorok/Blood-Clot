///initialize player variables

//player properties
dead = false;
on_ground = false;
in_water = false;
in_blood = false;
holding_jump_key = false;
invincible = false;
no_blood_loss = false;

//health
cur_blood = 3000;
max_blood = 3000;
min_blood = 0;
bleeds = 0;
can_bleed = true;

//healthbar vars
healthbar_scale = 3;
healthbar_width = 96;
healthbar_height = 12;
healthbar_x = 16;
healthbar_y = 16;

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
heavy_bleed_threshold = round(max_hold_time*0.7);

//stuck spears
stuck_spears = 0;
spear_pos = [];

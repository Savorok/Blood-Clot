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
bleed_per_sec = 0;

//sprite propertys
x_scale = 1.0; 
y_scale = 1.0;
alpha = 1;

//movement variables 
h_speed = 0;
v_speed = 0;
jump_relief = 1;

//action hold variables
hold_time = 0;
max_hold_time = 50;
heavy_bleed_threshold = round(max_hold_time*0.7);

//stuck spears
stuck_spears = 0;
spear_pos = [];

/// GUI variables

//general
scale = 3;

//healthbar vars
healthbar_scale = scale;
healthbar_width = 96;
healthbar_height = 12;
healthbar_x = 416;
healthbar_y = 16;

//bleed gui vars
bleed_icon_scale = scale;
bleed_icon_x = 740;
bleed_icon_y = 10;
bleed_number_x = 785;
bleed_number_y = 25;
bleed_sec_x = 730;
bleed_sec_y = 55;

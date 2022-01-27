slow_down = random_range(1.25,2.5);
scale = random_range(0.1,0.3);
alpha = 2;

image_xscale = scale;
image_yscale = scale;
direction = random(360);
gravity = 0.5;
vspeed = random_range(1,-6);
hspeed = random_range(-2,2);

vspd = vspeed;
hspd = hspeed;
spd = speed;
grav = gravity;

destroy_tick = irandom_range(10,30);
destroy_tick_count = 0;

unpaused = false;
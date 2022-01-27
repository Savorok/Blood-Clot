slow_down = random_range(1.25,2.5);
scale = random_range(0.2,0.6);
alpha = 2;

image_xscale = scale;
image_yscale = scale;
direction = random(360);//direction of paticle
gravity = 0.5;
vspeed = random_range(6,-24);//vetical speed
hspeed = random_range(-6,24);//horizontal speed

vspd = vspeed;
hspd = hspeed;
spd = speed;
grav = gravity;

destroy_tick = irandom_range(10,30);
destroy_tick_count = 0;

unpaused = false;
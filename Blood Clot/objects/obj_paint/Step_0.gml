image_angle = direction;
image_alpha = alpha;

if(!Level_Controller.paused)
{
	//destory if alive for max tick count
	if(destroy_tick_count == destroy_tick)
	{
		instance_destroy();
	}
	
	//check for collision
	if(place_meeting(x,y,obj_solid))
	{
		visible = false;
		if(speed > 0)
		{
			speed -= slow_down;
			alpha -= 0.01;
		}
	
		//draw to surface
		surface_set_target(Blood_Controller.surface_blood);
		draw_sprite_ext(spr_confetti,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,alpha);
		surface_reset_target();
	}
	else
	{
		visible = true;	
	}
	if(alpha <= 0)
	{
		instance_destroy();	
	}
	
	//save the speed variables for pausing
	vspd = vspeed;
	hspd = hspeed;
	spd = speed;
	grav = gravity;
	
	destroy_tick_count++;
	
}
else
{
	//if paused stop the particle
	unpaused = true;
	vspeed = 0;
	hspeed = 0;
	speed = 0;
	gravity = 0;
}








function scr_collision()
{
	///moving horizontally
		
	//check for collision
	if(place_meeting(x+h_speed,y,obj_solid))
	{
		while(!place_meeting(x+sign(h_speed),y,obj_solid)){x += sign(h_speed);}
		h_speed = 0;
	}
	//apply speed
	x += h_speed;
		
	///move vertically
		
	//check for collision
	if(place_meeting(x,y+v_speed,obj_solid))
	{
		while(!place_meeting(x,y+sign(v_speed),obj_solid)){y += sign(v_speed);}
		v_speed = 0;
			
		if(place_meeting(x,y+1,obj_solid))
		{
			on_ground = true;
			x_scale = 1.25;
			y_scale = 0.75;
		}	
	}
		
	//apply speed
	y += v_speed;
}
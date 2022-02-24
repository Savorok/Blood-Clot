///@description this function will check if the player is on the ground, if they are return true, if not
//apply a gravity force to the player and return false

function scr_player_grounded()
{
	if(place_meeting(x,y+1,obj_solid))
	{
		return true;
	}
	else if(holding_jump_key)
	{
		v_speed += Level_Controller.room_gravity*0.5;	
		return false;
	}
	else if(in_water)
	{
		v_speed += Level_Controller.room_gravity/global.water_gravity - v_speed/global.water_splash_modifier;
		return false;
	}
	else if(in_blood)
	{
		v_speed += Level_Controller.room_gravity/global.blood_gravity;
		return false;
	}
	else
	{
		v_speed += Level_Controller.room_gravity;
		return false;
	}	
}
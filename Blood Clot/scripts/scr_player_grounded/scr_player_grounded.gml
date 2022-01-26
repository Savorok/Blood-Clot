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
	else
	{
		v_speed += Level_Controller.room_gravity;
		return false;
	}
}
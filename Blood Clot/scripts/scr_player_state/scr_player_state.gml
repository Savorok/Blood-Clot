///@description will update what state the player is in: in air, on ground, in water
function scr_player_state()
{
	//check if we are in the water
	if(place_meeting(x,y,obj_water)){ in_water = true; }
	else{ in_water = false; }
	
	if(place_meeting(x,y,obj_liquid_blood)){ in_blood = true; }
	else{ in_blood = false; }
		
	//check if player is grounded
	on_ground = scr_player_grounded();	
}
/// @description 
x -= h_speed;

if(place_meeting(x-2,y,obj_player))
{
	show_debug_message("Hit")	
	stuck_to_player = true;
}
else if(place_meeting(x,y,obj_solid))
{
	stuck = true;
}

if(stuck)
{
	visible = true;
	h_speed = 0;
	draw_sprite(spr_spear,0,x,y);
	//instance_destroy();
}

if(stuck_to_player)
{
	visible = true;
	h_speed = 0;	
}
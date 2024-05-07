/// @description 
x -= h_speed;

if(place_meeting(x-2,y,obj_player) and !stuck_to_player)
{
	stuck_to_player = true;
	relx = x-obj_player.x;
	rely = obj_player.y - y;
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
	x = obj_player.x + relx - 2;
	y = obj_player.y - rely;
}
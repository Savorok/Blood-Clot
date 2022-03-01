//draw grid
if(draw_grid)
{
	//draw vertical
	vert_lines = room_width/16;
	cur_x = -1
	for(i = 0; i < vert_lines; i++)
	{
		draw_set_color(grid_colour);
		draw_set_alpha(grid_alpha);
		draw_line(cur_x,0,cur_x,room_height);
		cur_x += 16;
	}
	//draw horizontal
	horz_lines = room_height/16;
	cur_y = -1;
	for(i = 0; i < horz_lines; i++)
	{
		draw_set_color(grid_colour);
		draw_set_alpha(grid_alpha);
		draw_line(0,cur_y,room_width,cur_y);
		cur_y += 16;
	}
}


switch(cur_spawn)
{
	case "None":
		break;
	
	#region bonus
	
	case "Blood bag":
		draw_sprite(spr_blood_bag,0,spawn_x,spawn_y);		
		break;
		
	case "Confetti bomb":
		draw_sprite(spr_paint_bomb,0,spawn_x,spawn_y);		
		break;
		
	case "Paint bomb":
	    draw_sprite(spr_paint_bomb_single,paint_colour_num,spawn_x,spawn_y);		
		break;
		
	#endregion
	
	#region obstacles
	
	case "Spikes right":
		draw_sprite(spr_spikes_right,0,spawn_x,spawn_y);
		break;
	case "Spikes left":
		draw_sprite(spr_spikes_left,0,spawn_x,spawn_y);
		break;
	case "Spikes up":
		draw_sprite(spr_spikes_up,0,spawn_x,spawn_y);
		break;
	case "Spikes down":
		draw_sprite(spr_spikes_down,0,spawn_x,spawn_y);
		break;
		
	#endregion
	
}
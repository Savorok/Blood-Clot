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
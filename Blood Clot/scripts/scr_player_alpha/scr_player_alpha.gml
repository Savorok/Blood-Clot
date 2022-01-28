function scr_player_alpha()
{
	
	if(cur_blood = max_blood)
	{
		if(alpha < 1){ alpha += 0.005; }
	}
	else if(cur_blood > 2500 and cur_blood < max_blood)
	{
		if(alpha < 0.95){ alpha += 0.005; }	
	}
	else if(cur_blood > 2000 and cur_blood < 2500)
	{
		if(alpha < 0.90){ alpha += 0.005; }
	}
	else if(cur_blood > 1500 and cur_blood < 2000)
	{
		if(alpha < 0.85){ alpha += 0.005; }
	}
	else if(cur_blood > 1000 and cur_blood < 1500)
	{
		if(alpha < 0.80){ alpha += 0.005; }
	}
	else if(cur_blood > 500 and cur_blood < 1000)
	{
		if(alpha < 0.75){ alpha += 0.005; }
	}
							
	//limit alpha
	if(alpha < 0.7){ image_alpha = 0.7; }
	if(alpha > 1){image_alpha = 0.7; }
	
	image_alpha = alpha; 
	
}
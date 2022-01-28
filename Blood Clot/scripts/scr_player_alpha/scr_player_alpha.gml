function scr_player_alpha()
{
	var M = (max_blood-max_blood/2)/(1-0.85);
	var C = max_blood - M
	
	expected_alpha = (cur_blood-C)/M
	
	//change sprite alpha over time
	if(alpha < expected_alpha){alpha += 0.01;}
	if(alpha > expected_alpha){alpha -= 0.01;}
						
	//limit alpha
	if(alpha < 0.7){ image_alpha = 0.7; }
	if(alpha > 1){image_alpha = 0.7; }
		
	image_alpha = alpha; 	
}
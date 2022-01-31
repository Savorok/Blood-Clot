///@description This function will use y = Mx + C to calculate the player sprite alpha based on how
// much blood the player has left, The alpha value is clamped between 0.7 and 1 while the blood value 
// can be changed as needed

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
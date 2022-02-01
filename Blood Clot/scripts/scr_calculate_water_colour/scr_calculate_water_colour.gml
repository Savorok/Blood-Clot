function scr_calculate_water_colour()
{
	#region get rgb colour values of prim,sec and border
	
	//primary colour
	var pR1 = color_get_red(col_primary_blue);
	var pG1 = color_get_green(col_primary_blue);
	var pB1 = color_get_blue(col_primary_blue);
	
	var pR2 = color_get_red(col_primary_red);
	var pG2 = color_get_green(col_primary_red);
	var pB2 = color_get_blue(col_primary_red);
	
	//secondary colour
	var sR1 = color_get_red(col_sec_blue);
	var sG1 = color_get_green(col_sec_blue);
	var sB1 = color_get_blue(col_sec_blue);
	
	var sR2 = color_get_red(col_sec_red);
	var sG2 = color_get_green(col_sec_red);
	var sB2 = color_get_blue(col_sec_red);
	
	//border colour
	var bR1 = color_get_red(col_white_border);
	var bG1 = color_get_green(col_white_border);
	var bB1 = color_get_blue(col_white_border);
	
	var bR2 = color_get_red(col_red_border);
	var bG2 = color_get_green(col_red_border);
	var bB2 = color_get_blue(col_red_border);
	
	#endregion
	
	#region get new rgb values and new alpha
	
	//primary colour
	new_pR = linearEquation(pR1,pR2,max_water,cur_water);
	new_pG = linearEquation(pG1,pG2,max_water,cur_water);
	new_pB = linearEquation(pB1,pB2,max_water,cur_water);
	
	//secondary colour
	new_sR = linearEquation(sR1,sR2,max_water,cur_water);
	new_sG = linearEquation(sG1,sG2,max_water,cur_water);
	new_sB = linearEquation(sB1,sB2,max_water,cur_water);
	
	//border colour
	new_bR = linearEquation(bR1,bR2,max_water,cur_water);
	new_bG = linearEquation(bG1,bG2,max_water,cur_water);
	new_bB = linearEquation(bB1,bB2,max_water,cur_water);
	
	//alpha
	new_alpha = linearEquation(0.5,0.9,max_water,cur_water);
	
	#endregion
	
	#region set the new colours
				
	col_primary =  make_color_rgb(new_pR,new_pG,new_pB);
	col_secondary = make_color_rgb(new_sR,new_sG,new_sB);
	col_border = make_color_rgb(new_bR,new_bG,new_bB);
	cur_alpha = new_alpha

	#endregion
}

///@function linearEquation(x1,y1,x2,y2)
///@param c1 the starting colour value
///@param c2 the finish colour value
///@param D the max water value
///@param _x the current water level
function linearEquation(c1,c2,D,_x)
{
	var M = (c1-c2)/D;
	var C = M*_x + c2;

	return C;
}


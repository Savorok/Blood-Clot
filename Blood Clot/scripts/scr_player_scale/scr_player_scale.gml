///@description This function will adjust the players x and y scale towards 1

function scr_player_scale()
{
	if(x_scale < 1.0){x_scale += 0.02};
	if(x_scale > 1.0){x_scale -= 0.02};

	if(y_scale < 1.0){y_scale += 0.02};
	if(y_scale > 1.0){y_scale -= 0.02};
}
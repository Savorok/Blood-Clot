//set the font size of the gui
function scr_gui_set_font(gui_scale)
{
	switch(gui_scale)
	{
		case 1:
			draw_set_font(fnt_gui_10);
		break;
		
		case 1.2:
			draw_set_font(fnt_gui_12);
		break;
		
		case 1.4:
			draw_set_font(fnt_gui_14);
		break;
		
		case 1.6:
			draw_set_font(fnt_gui_16);
		break;
		
		case 1.8:
			draw_set_font(fnt_gui_18);
		break;
		
		case 2:
			draw_set_font(fnt_gui_20);
		break;
		
		default:
			draw_set_font(fnt_gui_10);
		break;
	}
}
if(!activated and Imgui_Controller.show_debug_masks)
{
	draw_self();
}
else if(activated and !Imgui_Controller.show_debug_masks)
{
	draw_self();
	image_index = 1;
}
else if(activated and Imgui_Controller.show_debug_masks)
{
	draw_self();
	image_speed = 0.1;	
}



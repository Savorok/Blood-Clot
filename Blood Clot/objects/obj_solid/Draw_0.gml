/// @description Only draw when in debug mode
if(Global_Controller.dev_mode)
{
	if(Imgui_Controller.show_debug_masks)
	{
		draw_self();
	}
}

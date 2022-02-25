/// @description Only draw when in debug mode
if(Global_Controller.dev_mode)
{
	if(Imgui_dev_menu.show_debug_masks)
	{
		draw_self();
	}
}

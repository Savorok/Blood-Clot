// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ColourButton(active, col, text)
{
	if(active)
	{
		//coloured button
		imguigml_push_id(1);
		imguigml_push_style_color(EImGui_Col.Button,imguigml_color_convert_gml_to_u32(col));
		imguigml_button(text);
		imguigml_pop_style_color(1);
		imguigml_pop_id();
	}
}
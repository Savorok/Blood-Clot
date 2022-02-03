function HelpHover(hover_text = "Default text")
{
	imguigml_text_disabled("(?)")
	if(imguigml_is_item_hovered())
	{
		imguigml_begin_tooltip();
		imguigml_push_text_wrap_pos(imguigml_get_font_size() * 35);
		imguigml_text(hover_text);
		imguigml_pop_text_wrap_pos();
		imguigml_end_tooltip();
	}
}
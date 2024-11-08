
var _left = bbox_left;
var _top = bbox_top;
var _appScale = surface_get_height(application_surface)/360;
var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);

waterSurface = surface_create(sprite_width,sprite_height+transparencyBufferHeight);
surface_set_target(waterSurface);

	draw_clear_alpha(c_blue,0);
	draw_surface_part_ext(application_surface, (_left - _camX) * _appScale, (_top - _camY) * _appScale, sprite_width * _appScale, sprite_height * _appScale, 0, transparencyBufferHeight, 1 / _appScale, 1 / _appScale, c_white, 1);
	gpu_set_colorwriteenable(true,true,true,false);
	draw_set_alpha(cur_alpha);
	draw_set_color(col_primary);
	draw_rectangle(0,transparencyBufferHeight,sprite_width,sprite_height+transparencyBufferHeight,false);
	draw_set_color(col_secondary);
	draw_line(0,transparencyBufferHeight+1,sprite_width,transparencyBufferHeight+1);

	draw_set_color(col_border);
	draw_line(0,transparencyBufferHeight,sprite_width,transparencyBufferHeight);
	draw_set_alpha(1);
	gpu_set_colorwriteenable(true,true,true,true);

	surface_reset_target();

pw = texture_get_texel_width(surface_get_texture(waterSurface));
ph = texture_get_texel_height(surface_get_texture(waterSurface));

resizeSurface = surface_create(sprite_width,sprite_height+transparencyBufferHeight);
surface_set_target(resizeSurface);
	draw_clear_alpha(col_border,0);
	shader_set(shader_wave);
	shader_set_uniform_f(shader_value_pixelH,ph);
	shader_set_uniform_f(shader_value_pixelW,pw);
	shader_set_uniform_f(shader_value_springCount,springCount);
	shader_set_uniform_f_array(shader_value_springs,springs);
	shader_set_uniform_f(shader_value_time ,get_timer()*0.0000025);
	draw_surface(waterSurface,0,0);
	shader_reset();
	surface_reset_target();
	
draw_surface(resizeSurface,_left,_top-transparencyBufferHeight);

surface_free(waterSurface);
surface_free(resizeSurface);
	




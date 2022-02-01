/// @description init variables

#region water variables

image_alpha = 0.5;
transparencyBufferHeight = 32;
springCount = ceil(sprite_width);
springs[springCount] = 0;
springsVelocity[springCount] = 0;
springDeltaL[springCount] = 0;
springDeltaR[springCount] = 0;
k = 0.035;
d = 0.025;
spread = 0.25;

#endregion

#region shader input values

shader_value_pixelH = shader_get_uniform(shader_wave,"pixelH");
shader_value_pixelW = shader_get_uniform(shader_wave,"pixelW");
shader_value_springCount = shader_get_uniform(shader_wave,"springCount");
shader_value_springs = shader_get_uniform(shader_wave,"springs");
shader_value_time = shader_get_uniform(shader_wave,"time");

#endregion

#region water colours

col_primary_blue = make_color_rgb(41,187,244);
col_sec_blue = make_color_rgb(42,235,244);
col_white_border = make_color_rgb(255,255,255);

col_primary_red = make_color_rgb(215,6,6);
col_sec_red = make_color_rgb(210,6,6);
col_red_border = make_color_rgb(220,6,6);

col_primary = col_primary_blue;
col_secondary = col_sec_blue;
col_border = col_white_border;
cur_alpha = 0.5;

#endregion

#region water properties

max_water = sprite_width * sprite_height * 8;
cur_water = max_water;

#endregion
/// @description init variables
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

shader_value_pixelH = shader_get_uniform(shader_wave,"pixelH");
shader_value_pixelW = shader_get_uniform(shader_wave,"pixelW");
shader_value_springCount = shader_get_uniform(shader_wave,"springCount");
shader_value_springs = shader_get_uniform(shader_wave,"springs");
shader_value_time = shader_get_uniform(shader_wave,"time");

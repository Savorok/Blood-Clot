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

global.u_pixelH_Wave = shader_get_uniform(shader_wave,"pixelH");
global.u_pixelW_Wave = shader_get_uniform(shader_wave,"pixelW");
global.u_springCount = shader_get_uniform(shader_wave,"springCount");
global.u_springs = shader_get_uniform(shader_wave,"springs");
global.u_time = shader_get_uniform(shader_wave,"time");

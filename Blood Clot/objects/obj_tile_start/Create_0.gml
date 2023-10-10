/// @description add collision
col_floor = instance_create_layer(-64,room_height-16-256,"Collisions",obj_solid);
col_floor.image_xscale = 36;
col_floor.image_yscale = 12;

col_left = instance_create_layer(-64,room_height-sprite_get_height(spr_tile_start)-256,"Collisions",obj_solid);
col_left.image_yscale = 4;
col_left.image_xscale = 8;

col_right = instance_create_layer(room_width-64,room_height-sprite_get_height(spr_tile_start)-256,"Collisions",obj_solid);
col_right.image_yscale = 4;
col_right.image_xscale = 8;
/// @description create the start tile and player
instance_create_layer(room_width/2,room_height-256,"tiles",obj_tile_start);
instance_create_layer(room_width/2,room_height-sprite_get_height(spr_player)-256,"Instances",obj_player);
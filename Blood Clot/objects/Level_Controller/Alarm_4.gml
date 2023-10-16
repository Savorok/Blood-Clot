/// @description Generate level collisions

//get the collision map for the level
var collision_map = scr_get_collision_area(layer_tilemap_get_id("Tiles_1"));

//generate the collision rectangles
var rects = scr_generate_collision_areas(collision_map);

//instatiate the collision from the rectangles
scr_instantiate_collisions(rects);

//we are finished generating the level collision so destroy the spawn object, spawn the player and player camera
generating = false;
instance_destroy(obj_player_spawn);
alarm[0] = 1;
Camera_Controller.alarm[2] =1;
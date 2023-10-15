/// @description Generate level collisions
var colmap = scr_get_collision_area(layer_tilemap_get_id("Tiles_1"));
scr_generate_collision_areas(colmap);
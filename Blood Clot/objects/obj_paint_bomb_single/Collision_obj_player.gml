/// @description blow up when player touches
var confetii_amount = irandom_range(100,150)

var paint = obj_confetii

repeat(confetii_amount) instance_create_depth(x,y,100,paint) 
with(paint)
{
	paint.image_index = colour;
	paint.image_speed = 0;
}

instance_destroy();
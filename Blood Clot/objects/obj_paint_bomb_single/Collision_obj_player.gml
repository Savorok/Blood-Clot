/// @description blow up when player touches
var confetti_amount = irandom_range(100,150)

repeat(confetti_amount)  
{
	var paint = instance_create_depth(x,y,100,obj_paint);	
	paint.image_index = colour;
	paint.image_speed = 0;
}

instance_destroy();
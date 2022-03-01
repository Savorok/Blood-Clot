/// @description blow up when player touches
var confetti_amount = irandom_range(100,150)

repeat(confetti_amount)  
{
	var paint = instance_create_layer(x,y,"Particles",obj_paint);	
	paint.image_index = colour;
	paint.image_speed = 0;
}

instance_destroy();
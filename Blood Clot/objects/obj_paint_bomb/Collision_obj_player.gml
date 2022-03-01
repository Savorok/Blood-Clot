/// @description blow up when player touches
var confetti_amount = irandom_range(100,150)
repeat(confetti_amount * 7) instance_create_layer(x,y,"Particles",obj_confetti) 


instance_destroy();
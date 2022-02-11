/// @description blow up when player touches
var confetti_amount = irandom_range(100,150)
repeat(confetti_amount * 7) instance_create_depth(x,y,100,obj_confetti) 


instance_destroy();
/// @description blow up when player touches
var confetii_amount = irandom_range(100,150)
repeat(confetii_amount * 7) instance_create_depth(x,y,100,obj_confetii) 


instance_destroy();
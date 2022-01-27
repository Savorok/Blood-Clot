/// @description Kill when touching

var blood_amount = irandom_range(Blood_Controller.splatter_size-10,Blood_Controller.splatter_size+10);
repeat(blood_amount) instance_create_depth(obj_player.x,obj_player.y,-100,obj_blood);

dead = true;

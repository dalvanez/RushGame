/// @description Show Score
if (!instance_exists(obj_fx_intro) && !instance_exists(obj_ship) && !instance_exists(obj_total_score)) instance_create_layer(x,y,"FX",obj_total_score);
alarm[1] = -1;
/// @description Countdwown to expire.
if life-- <= 0 {
	instance_destroy();
}

if collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,obj_fx_scorecard,false,true) {
	y+=24;
}
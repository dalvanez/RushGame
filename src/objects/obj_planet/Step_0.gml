/// @description Move up.
if instance_exists(obj_ship) && !instance_exists(obj_drag_tutorial) {	//After the tutorial is finished...
	y = clamp(y-.002,224,infinity);
	image_xscale = clamp(image_xscale*1.00005,1,1.25);
	image_yscale = clamp(image_yscale*1.00005,1,1.25);
	image_index = 0;
	image_speed = 0;
}
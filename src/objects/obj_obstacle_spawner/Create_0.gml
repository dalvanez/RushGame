/// @description Init
//obstacles = 15;			//How many obstacles this spawner has left to spawn.
obstacles = tag_get_asset_ids("obstacle",asset_object);	//Gather all the object ids tagged as obstacles
alarm[0] = irandom(32)+64;								//Alarm to spawn obstacles

//Particles
debris_fx = part_system_create();

debris = part_type_create();
part_type_direction(debris,0,360,0,.2);
part_type_speed(debris,0.4,1,.05,.01);
part_type_shape(debris,pt_shape_pixel);
part_type_life(debris,24,50);
part_type_alpha3(debris,1,1,0);
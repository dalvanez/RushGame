/// @description Init

alarm[0] = 15;				//Set alarm to explode.

//Graphical Variables
explosion_count = 0;		//The number of times alarm[0] has gone off.

//Particles
fx_system = part_system_create();

explosion = part_type_create();
part_type_sprite(explosion,spr_explosion,true,false,true);
part_type_size(explosion,1,1,0.05,0);
part_type_color1(explosion,c_white);
part_type_life(explosion,16,16);
/// @description Spawn Obstacle
if !instance_exists(obj_drag_tutorial) && !instance_exists(obj_obstacle_tutorial) {	//Once the player knows how to control the ship...
	repeat (floor(global.game_difficulty/4)+1) {
		var _obstacle = obstacles[irandom(array_length(obstacles)-1)];
		var _width = sprite_get_width(spr_debris_large)/2;
		with instance_create_layer(irandom_range(_width,room_width-_width),room_height+120,"Instances",_obstacle) {
			fx_system	= other.debris_fx;
			fx_particle = other.debris;
		}
	}
}
if (instance_exists(obj_ship)) alarm[0] = irandom(32)+(64-clamp(floor((64*global.game_difficulty)*.05),0,60));	//Alarm to spawn obstacles
else						   alarm[0] = -1;
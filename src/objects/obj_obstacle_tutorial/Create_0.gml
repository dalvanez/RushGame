/// @description Init
// Inherit the parent event
event_inherited();

y_pos = 200;			//The target y position for this object to be at.
move_up = true;			//Whether to introduce this obstacle to the game area.

if instance_exists(obj_obstacle_spawner) {	//Assign particles to self.
	fx_particle	 = obj_obstacle_spawner.debris;
	fx_system	 = obj_obstacle_spawner.debris_fx;
}
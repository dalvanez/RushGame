/// @description Init
//spd = .2;							//The amount of speed added to this obstacle each frame.
fx_system	= noone;				//The particle system for this object.
fx_particle = noone;				//The particle created when destroyed.
spd*=global.game_difficulty;		//Adjust speed to meet the difficulty when this object spawned.
rotation	= random_range(0,360);	//Angle of the drawn sprite.
rotate_spd	= random_range(-.8,.8);	//Amount by which the rotation changes.
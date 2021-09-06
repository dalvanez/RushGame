/// @description Create Debris Particles
if fx_particle!=noone && fx_system!=noone {	//These values are initialized to noone, so if they're not noone they're probably usable.
	repeat debris_count {
		part_particles_create(fx_system,x,y,fx_particle,4);
	}
}

if (!global.success) play_sound(choose(snd_explosion0,snd_explosion1,snd_explosion2));	//Play a random explosion sound
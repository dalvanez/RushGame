/// @description Create Explosions
repeat 6 {
	var _x = irandom(room_width);
	var _y = irandom(4);
	part_particles_create(fx_system,_x,_y,explosion,1);
}
explosion_count++;

switch(explosion_count) {
	case 2:
		play_sound(snd_intro_explosion1);
		break;
	case 6:
		play_sound(snd_intro_explosion);
		break;
}

if explosion_count > 8 {
	alarm[0] = -1;
	alarm[1] = 60;
} else alarm[0] = 7;
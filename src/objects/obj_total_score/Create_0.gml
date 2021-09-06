/// @description Init
play_sound_single(snd_scary);
alarm[0] = 256;						//Alarm to allow restart.
restart_prompt = false;				//Whether to allow restarting or not.
max_wins = floor(room_width/16)-1;	//The maximum wins that can be displayed on the screen.

passenger = noone				//Variable holding a copy of the struct for the player passenger that beat the game.
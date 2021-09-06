#macro fnt_font font_add_sprite_ext(spr_font,"!\"$%'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~",false,0)
#macro default_difficulty	0.5;
#macro score_goal_inc		50000;

#macro screen_width			540

#macro screen_height		960

//@function				play_sound();
//@description			Plays a sound without looping or high priority.
function play_sound(snd) {
	audio_play_sound(snd,50,false);
}

//@function				play_sound_single();
//@description			Plays a sound only if there isn't already that sound playing.
function play_sound_single(snd) {
	if !audio_is_playing(snd) play_sound(snd);
}

global.game_difficulty = default_difficulty;		//Difficulty float; manages speed of obstacles as well as size.
global.success = false;								//Whether or not the game has been won.
global.score_goal = score_goal_inc;					//The score needed to beat the game.
global.wins = 0;									//How many times the player has beat the game.
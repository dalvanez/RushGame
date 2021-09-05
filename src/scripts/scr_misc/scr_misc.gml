#macro fnt_font font_add_sprite_ext(spr_font,"!\"$%'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~",false,0)
#macro default_difficulty 0.5;

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
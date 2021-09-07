/// @description Draw final score to screen.
draw_set_font(fnt_font);
draw_set_color(c_silver);
var _ww = room_width/2;
var _wh = room_height/2;
var _txt = string(score);
draw_text(_ww-(string_width(_txt)/2),_wh,_txt);

var _prompt = spr_mouse_left;
var _xscale = 1;
var _yscale = 1;
if (global.mobile_device) {
	_prompt = spr_hand;
	_xscale = 2;
	_yscale = 2;
}

if (restart_prompt) draw_sprite_ext(_prompt,0,_ww,_wh+sprite_get_height(_prompt)+16,_xscale,_yscale,0,c_white,1);
if (global.success && passenger!=noone) {
	draw_sprite_ext(spr_alien,passenger.index,_ww,_wh-sprite_get_height(spr_alien),1,1,0,passenger.color,1);
}

//Draw stars to show how many times the player has won.
for (var i = 0; i < clamp(global.wins,0,max_wins); i++) {
	draw_sprite(spr_win,0,(i*14),2);
}

//Draw Version number in bottom left
draw_set_color(c_white);
draw_text(room_width-string_width(GM_version),room_height-string_height(GM_version),GM_version);
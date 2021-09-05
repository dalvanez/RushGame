/// @description Draw final score to screen.
draw_set_font(fnt_font);
draw_set_color(c_silver);
var _ww = room_width/2;
var _wh = room_height/2;
var _txt = string(score);
draw_text(_ww-(string_width(_txt)/2),_wh,_txt);

if (restart_prompt) draw_sprite(spr_mouse_left,0,_ww-3,_wh+sprite_get_height(spr_mouse_left)+16);
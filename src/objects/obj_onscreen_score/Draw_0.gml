/// @description Draw the player's score on screen
if !instance_exists(obj_total_score) {	//If the total score screen isn't up...
	draw_set_color(c_silver);
	draw_set_font(fnt_font);
	var _txt = string(score);
	draw_text(room_width-string_width(_txt)-2,8,_txt);	//Draw the score
	draw_set_color(c_white);
}
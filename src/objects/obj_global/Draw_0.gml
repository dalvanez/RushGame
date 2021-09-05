/// @description Draw Border if in browser
if (os_browser!=browser_not_a_browser) || window_get_width()>540 {
	var _ww = room_width;
	var _w	= 2;
	
	draw_set_color(c_white);
	draw_line_width(0,0,0,960,_w);
	draw_line_width(_ww-1,0,_ww-1,960,_w);
}
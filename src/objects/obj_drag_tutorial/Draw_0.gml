/// @description Draw Dragging Tutorial
if (instance_exists(target_object)) {
	var _tx = target_object.x;
	var _ty = target_object.y;
	if (global.mobile_device) {			//Draw the gesture tutorial away from the ship
		_tx = room_width/2;
		if (mouse_check_button(mb_left)) _ty = mouse_y-140;
		else							 _ty = room_height/2;
	}
	
	draw_sprite_ext(spr_hand,0,_tx+x_offset,_ty+y_offset,pulse,pulse,image_angle,image_blend,image_alpha);
	switch(tutorial_animation) {
		case tanim.hold_click_tut:
			var _ww = mouse_x+8;
			var _wh = mouse_y-8;
			var segments = 2;
			var wheel_radius = 6;
			var _linew = 1;
			
			if (global.mobile_device) {
				if (_ww>room_width/2) _ww+=32;	//Render away from touch point.
				else				  _wh-=32;	//Prevent the circle animation from drawing offscreen.
				_wh-=48;
				wheel_radius = 12;
			}
		
			draw_set_color(c_black);
			draw_circle(_ww,_wh,wheel_radius+2,false);
			for (var i = 0; i < segments; i++) {
				var _degrees = (360 / segments)*(click_hold_time/floor(click_hold_goal*.9));
				var _angle = _degrees*i;
				repeat _degrees {
					draw_set_color(c_white);
					draw_line_width(_ww,_wh,_ww+(wheel_radius*cos(degtorad(-_angle))),_wh+(wheel_radius*sin(degtorad(-_angle))),_linew);
					_angle++;
				}
			}
			break;
		case tanim.drag_tut:
		case tanim.attack_tut:
			draw_set_color(c_black);
			draw_line_width(_tx,_ty,_tx+x_offset,_ty+y_offset,6);
			draw_set_color(c_white);
			draw_line_width(_tx,_ty,_tx+x_offset,_ty+y_offset,4);
			break;
	}
}
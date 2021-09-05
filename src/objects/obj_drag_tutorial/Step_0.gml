/// @description Play Animation
if instance_exists(target_object) {
	switch(tutorial_animation) {
		case tanim.click_tut:
			click_hold_time = 0;								//Reset values to default.
			x_offset = 0;										//''
			y_offset = 0;										//''
		
			pulse+=pulse_spd;									//Change the image scale for drawing.
			if (pulse>=max_pulse || pulse<=1) pulse_spd*=-1;	//Bounce back and forth from big and small.
			pulse = clamp(pulse,1,max_pulse);					//Limit the pulse to it's min and max size.
			break;
		case tanim.hold_click_tut:
			pulse = 1;
			if (mouse_check_button(mb_left))	click_hold_time++;	//Check if the player is still holding left click
			else			 tutorial_animation = tanim.click_tut;	//If they let go, just reset.
		
			if click_hold_time>click_hold_goal {					//Once the button has been held long enough, move on to next part.
				tutorial_animation = tanim.drag_tut;
				click_hold_time = 0;
			}
			break;
		case tanim.drag_tut:
			pulse = 1;
			if (!mouse_check_button(mb_left)) tutorial_animation = tanim.click_tut;	//If the player lets go of the left mouse button, reset.
		
			x_offset = clamp(x_offset+3,0,32);		//Animate the hand moving to the right.
			if (x_offset>=32 && alarm[0]<=0) {
				alarm[0] = 128;						//Eventually reset the x_offset
			}
		
			if abs(drag_x-mouse_x)>30 {
				drag_done = true;
				tutorial_animation = tanim.attack_tut;
				if (!instance_exists(obj_obstacle_tutorial)) instance_create_layer(128,576,"Instances",obj_obstacle_tutorial);
			}
			break;
		case tanim.attack_tut:
			pulse = 1;
			if (!mouse_check_button(mb_left)) tutorial_animation = tanim.click_tut;	//If the player lets go of the left mouse button, reset.
			x_offset = 0;
			
			if (attack_pause<=0) {
				y_offset = clamp(y_offset+8,0,128);		//Animate the hand moving downwards.
				if (y_offset>=128 && alarm[0]<=0) {		//Reset the hand.
					alarm[0] = 128;
				}
			} else attack_pause--;
			
			if !instance_exists(obj_obstacle_tutorial) instance_destroy();
			break;
	}

	if instance_exists(target_object) && target_object.object_index==obj_ship {	//If this tutorial is attached to a ship
		if (target_object.dragging && tutorial_animation==tanim.click_tut) {
			if (!drag_done) tutorial_animation = tanim.hold_click_tut;
			else			tutorial_animation = tanim.attack_tut;
			drag_x = mouse_x;
			drag_y = mouse_y;
		}
	}
}
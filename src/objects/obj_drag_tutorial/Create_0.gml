/// @description Init

enum tanim {
	click_tut,				//Tutorial to click on the object.
	hold_click_tut,			//Tutorial to hold down the mouse button.
	drag_tut,				//Tutorial to drag the object from side to side.
	attack_tut,				//Tutorial to attack and destroy obstacles.
}

//Gameplay Variables
target_object = noone;					//The object this hand should be attached to (ideally a ship or something)
tutorial_animation = tanim.click_tut;	//Current animation to play
click_hold_time = 0;					//How long the left click button has been held.
click_hold_goal = 100;					//The goal value for how long the left click button should be held.
drag_x = 0;								//Drag x position
drag_y = 0 ;							//Drag y position
drag_done = false;						//Whether the dragging tutorial is done or not.

//Graphical Variables
pulse = 0;					//The value that manages grow/shrink animation.
max_pulse = 1.5;			//Maximum size of the pulsing animation.
pulse_spd = .01;			//The value in which the pulse value changes.
x_offset = 0;				//Offset from attached point to draw hand.
y_offset = 0;				//Offset from attached point to draw hand.
attack_pause = 256;			//Time to wait until attack animation starts playing.
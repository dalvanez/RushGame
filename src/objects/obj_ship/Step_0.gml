/// @description Movement
if !entering && !exiting {
	ship_movement();	//Manages mouse movement
	ship_health();		//Manages destroyed state, repairs, etc
	ship_effects();		//Manages FX and such if they're not done by other functions.
	
	if (score>=global.score_goal) {
		global.success = true;
		exiting = true;
		global.wins++;
		if instance_exists(obj_obstacle) instance_destroy(obj_obstacle);
		if instance_exists(obj_obstacle_spawner) alarm[0] = -1;
	}
} else if entering {
	if (phy_position_y < y_pos) {	//Enter the screen
		phy_speed_y+=.2;
	} else {
		entering = false;
	}
} else {
	if bbox_top>room_height+4 {		//Exit the screen for the end of the game.
		with  instance_create_layer(0,0,"FX",obj_total_score) {
			passenger = other.passenger;	//Copy this passenger to the score card
		}
		phy_speed_y = 0;
		instance_destroy();
	} else {
		phy_speed_y = clamp(phy_speed_y+.05,0,2);
		
		var _vx = ((room_width/2)-x);
		phy_speed_x+=_vx*max_dragging_speed*.25;	//Move towards the center of the screen.
		phy_speed_x*=.6;							//Reduce speed.
		ship_angle*=.89;							//Rotate straight up.
		ship_angled*=.89;							//Rotate straight up.
	}
}
/// @description Movement
if !entering {
	ship_movement();	//Manages mouse movement
	ship_health();		//Manages destroyed state, repairs, etc
	ship_effects();		//Manages FX and such if they're not done by other functions.
} else {
	if (phy_position_y < y_pos) {
		phy_speed_y+=.2;
	} else {
		entering = false;
	}
}
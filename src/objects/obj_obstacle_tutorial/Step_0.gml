/// @description Spin around
rotation+=rotate_spd;

if (phy_position_y > y_pos+22) && move_up {
	phy_speed_y-=4*(1/abs(phy_position_y-y_pos));
} else {
	phy_speed_y*=.9;
}
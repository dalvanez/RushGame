/// @description Move Up.
phy_speed_y-=(spd);
rotation+=rotate_spd;
if (phy_position_y<-sprite_height) instance_destroy(self,false);	//Execute event flag is false since we don't need to see particles if they're out of the screen.
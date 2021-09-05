/// @description Init
//Graphical Variables
colors	= array_create(4);			//Initialize an array of colors to cycle through for the stars.
index	= 0;						//Current index in the array.
stars	= layer_get_id("Stars");	//Background Layer ID for the stars
stars	= layer_background_get_id(stars);

//Colors
colors[0] = make_color_hsv(0,0,90);
colors[1] = make_color_hsv(0,0,60);
colors[2] = make_color_hsv(0,0,40);
colors[3] = make_color_hsv(0,0,60);
layer_background_blend(stars,colors[0]);

alarm[0] = cycle_speed;				//Alarm to change the color.
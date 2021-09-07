/// @description Init
phy_fixed_rotation = true;	//Fix the rotation to the angle created.
randomise();

alarm[0] = 60;				//Increment survival time.

//Gameplay Variables
mouse_inside = false;		//Whether or not the mouse is hovered over this object.
dragging = false;			//Whether or not this object is being pulled towards the mouse cursor.
max_dragging_speed = 0.08;	//The maximum speed this object can move at while being dragged.
drag_x = x;					//The x where the ship is being dragged from.
drag_y = y;					//The y where the ship is being dragged from.
touch_y = y;				//The y where a mobile device has touched the screen.
max_dx = 60;				//The maximum difference between x and mouse_x allowed to allow swiping down
max_dy = 100;				//The threshold that allows or disallows attacking.
damage = 0;					//The amount of damage sustained by the ship
invulnerability = 0;		//How long until the ship can take damage again.
invuln_time	= 96;			//How many frames invulnerability lasts.
destroyed = false;			//Whether or not this ship is done for.
entering = true;			//Whether or not this ship is entering the screen for the first time.
exiting	 = false;			//Whether or not this shit is exiting the screen for the end screen.
thrust_reset = false;		//Whether to wait until the cursor returns to the ship to thrust again.
min_thrust = -64;			//The minimum thrust value; also the required value to thrust again.
thrusting = min_thrust;		//Amount of frames left for attacking
//y_pos	 = 96;				//The home position of the ship in the room.
thrust_y_pos = 130;			//The target position of the ship while attacking.
combo = 0;					//Number of obstacles destroyed in one attack.

//Graphical Variables
drag_yd = drag_y;			//The dampened value of drag_y to help make it look like the ship is being dragged from the location of the cursor
ship_angle	= 0;			//The angle that the ship sprite is drawn at.
ship_angled = ship_angle;	//The dampened value of the angle the ship sprite is drawn at.
ship_angle_max = 45;		//The maximum angle for the ship to tip at
passenger = {				//The Passenger on this ship.
	color: c_white,
	index: 0,
	new_passenger: function() {
		color = choose(c_purple,c_aqua,c_red,c_green,c_yellow);
		index = irandom(sprite_get_number(spr_alien));
	}
};
with (passenger) new_passenger();	//Generate a new passenger for this ship.

//Methods
eject_passenger = function() {
	with instance_create_layer(x,y,layer,obj_passenger) {
		image_index = other.passenger.index;
		image_blend = other.passenger.color;
	}
}

//Mobile Support
if (global.mobile_device) {
	ship_angle_max = 15;
	max_dx = infinity;	//Just allow swiping no matter where mouse_x is.
	max_dy = 60;
}

//Particles
ship_fx = part_system_create_layer(layer,false);		//Create a particle system for this spaceship.

dome_shatter = part_type_create();						//Destroy Particles
part_type_shape(dome_shatter,pt_shape_pixel);
part_type_color1(dome_shatter,c_white);
part_type_direction(dome_shatter,0,360,0,0);
part_type_speed(dome_shatter,0.1,2,-.001,0);
part_type_life(dome_shatter,2048,4096);

dome_crack = part_type_create();						//Damage Particles
part_type_shape(dome_crack,pt_shape_pixel);
part_type_color1(dome_crack,c_white);
part_type_direction(dome_crack,0,360,0,0);
part_type_speed(dome_crack,0.5,2,-.001,0);
part_type_alpha3(dome_crack,1,1,0);
part_type_life(dome_crack,96,128);

passenger_sweat = part_type_create();					//Uh Oh Particles
part_type_shape(passenger_sweat,pt_shape_pixel);
part_type_color1(passenger_sweat,c_aqua);
part_type_gravity(passenger_sweat,.1,270);
part_type_alpha2(passenger_sweat,1,0);
part_type_life(passenger_sweat,8,16);

thruster_fire = part_type_create();
part_type_shape(thruster_fire,pt_shape_pixel);
part_type_color1(thruster_fire,c_white);
part_type_direction(thruster_fire,270,270,0,0);
part_type_speed(thruster_fire,0.1,.2,0.01,0);
part_type_life(thruster_fire,20,34);
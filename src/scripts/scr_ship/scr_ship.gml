//@function					ship_movement();
//@description				Manages the control and movement of a space ship.
function ship_movement(){
	var mx = clamp(mouse_x,0,room_width);	//Restrict the mouse positions for calculation to the size of the room.
	var my = clamp(mouse_y,0,room_height);	//''
	
	if (mouse_check_button_pressed(mb_left) && mouse_inside && !destroyed) {
		dragging = true;	//Set the ship to be dragged towards cursor
		drag_x = x-mx;		//Set the position the ship is being dragged from.
		drag_y = y-my;		//''
	} else if (!mouse_check_button(mb_left) || destroyed) dragging = false;	//Stop being dragged towards cursor

	if dragging {
		var _dx = abs(mx-(x+drag_x));					//Difference between mouse and drag x
		var _dy = abs(my-(y+drag_y));					//Difference between mouse and drag y
		var _vx = (mx-(x+drag_x));						//Calculate movement vector.
		var _vy = (my-(y+drag_y));
		var _len = sqrt((_vx*_vx)+(_vy*_vy));
	
		_vx = _vx/_len;
		_vy = _vy/_len;
		var _spd = (((mx-x)/96)*max_dragging_speed);	//Apply speed relative to distance from cursor.
	
		phy_speed_x+= _vx*abs(_spd);					//Apply the speed in the correct direction.
		
		if (_dx < 60 && thrusting<=min_thrust && _dy > 100 && !thrust_reset) {		//Thrust downward as an attack.
			thrusting = 50;
			thrust_reset = true;
			play_sound_single(snd_attack);
		}
		
		if (my<bbox_bottom+180) thrust_reset = false;	//If the mouse returned to the ship
	} else if destroyed {
		phy_speed_x*=.7;								//Slow the ship down every step
		phy_speed_y-=.2;								//Send the ship upwards out the screen.
		
		if (phy_position_y<-sprite_height)	instance_destroy();	//Destroy this ship once it's off-screen.
	}
	
	if thrusting>0 {
		if (phy_position_y<thrust_y_pos) phy_speed_y+=5;
		else							 phy_speed_y*=.4;
		invulnerability = 28;			//Give the player mercy frames throughout & shortly after thrusting.
	} else if phy_position_y > y_pos+8 {
		phy_speed_y-=1;
		combo = 0;
	}

	if (thrusting > min_thrust) thrusting--;

	drag_yd+=(drag_y-drag_yd)*.5;	//Dampen drag_yd towards drag_y; prevents "snapping" when cursor hovers over ship
	ship_angle = clamp((phy_speed_x*15)*(-drag_yd/sprite_height),-45,45);	//Calculate the intended ship angle
	ship_angled+= (ship_angle-ship_angled)*.85;								//Dampen angle towards intended angle
	phy_speed_x*=.98;														//Slow the ship down gradually
	if (!destroyed) phy_speed_y*=.75;										//Slow the ship down quickly

	var _padding = 24;				//Amount (in pixels) of space from the side of the screen.
	if ((phy_position_x>room_width-_padding && phy_speed_x>0) || (phy_position_x<_padding && phy_speed_x<0)) {
		phy_speed_x*=.55;			//Slow the ship down drastically to prevent it from going off screen.
	}
}

//@function					ship_health();
//@description				Manages the ship's damage sustained and destroyed states.
function ship_health() {
	damage = clamp(damage,0,sprite_get_number(spr_ship_dome)-1);
	invulnerability = clamp(invulnerability-1,0,infinity);	//Decrement invulnerability time
	if !destroyed {
		if (damage>(sprite_get_number(spr_ship_dome)-2)) {	//If we've hit max damage and haven't been destroyed yet.
			play_sound_single(snd_dome_shatter);			//Play loss sound.
			repeat 24 {										//Create the dome shatter effects.
				var _w = sprite_width/2;
				var _x = irandom_range(-_w,_w);
				var _y = irandom_range(-48,2);
			
				part_particles_create(ship_fx,x+_x,y+_y,dome_shatter,2);
			}
			destroyed = true;
			eject_passenger();	//Propel the passenger into space for dramatic effect.
			with (obj_global) alarm[1] = 90;	//Show the scorecard after some time.
		} else if (damage>(sprite_get_number(spr_ship_dome)-1) div 2) && current_time%3==0 {	//If we're cutting it close...
			repeat 4 {												//Create some sweat beads along the passenger's head (kinda)
				var _x = irandom_range(-4,4);
				var _create = irandom(16);
				if (_create>14) part_particles_create(ship_fx,x+_x,y-26,passenger_sweat,1);
			}
		}
	}
}

//@function					ship_damage(amount);
//@param{integer}	amount	The amount to damage the ship by
//@description				Damages the ship by a certain amount.
function ship_damage(amount) {
	if is_undefined(amount) amount = 1;	//Ensure there is an amount to apply
	if invulnerability<=0 && !exiting {
		damage+=amount;
		if (amount>0) {						//If we're doing actual damage, then create particles.
			play_sound_single(snd_damage);	//Play damage sound
			repeat 15 {						//Create 16 particles at random positions across the ship dome.
				var _w = sprite_width/2;
				var _x = irandom_range(-_w,_w);
				var _y = irandom_range(-48,2);
			
				part_particles_create(ship_fx,x+_x,y+_y,dome_crack,1);
			}
		}
		invulnerability = invuln_time;
	}
}

//@function				ship_fx();
//@description			Creates the particle effects for the ship.
function ship_effects() {
	if (thrusting == min_thrust+1) && (!instance_exists(obj_fx_charge)) with instance_create_layer(x,y,"FX",obj_fx_charge) {
		target = other;			//Attach to the ship
		image_alpha = 1;		//Play animation
		image_speed = 1;
	}
}
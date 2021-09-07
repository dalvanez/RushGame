/// @description Increase difficulty.
if (!instance_exists(obj_drag_tutorial)) {
	global.game_difficulty+=.05;	//If the tutorial is over, increment difficulty
	if instance_exists(obj_ship) with (obj_ship) {
		max_dragging_speed*=((global.game_difficulty*.035)+1);	//Allow the ship to move faster when the asteroids go faster.
		max_dragging_speed = clamp(max_dragging_speed,0,0.38);	//Limit how fast the ship can go since it will get unwieldy.
	}
	alarm[0] = difficulty_time;
} else {
	alarm[0] = 5;					//Wait 5 game steps.
}
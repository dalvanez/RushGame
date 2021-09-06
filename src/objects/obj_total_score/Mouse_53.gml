/// @description "Restart" the game
if restart_prompt {
	passenger = noone;
	if instance_exists(obj_ship) instance_destroy(obj_ship);
	instance_create_layer(room_width/2,-96,"Instances",obj_ship);
	if !global.success {			//Reset score and difficulty on lose.
		score = 0;
		global.game_difficulty = default_difficulty;
	} else {
		global.score_goal+=score_goal_inc;	//Add to the score goal to allow the player to keep playing for a higher score.
	}
	global.success = false;
	with (obj_obstacle_spawner) alarm[0] = 90;
	instance_destroy();
}
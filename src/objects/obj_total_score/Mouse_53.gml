/// @description "Restart" the game
if restart_prompt {
	instance_create_layer(room_width/2,-96,"Instances",obj_ship);
	global.game_difficulty = default_difficulty;
	score = 0;
	with (obj_obstacle_spawner) alarm[0] = 90;
	instance_destroy();
}
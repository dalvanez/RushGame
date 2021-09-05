/// @description Play Music
if ds_map_find_value(async_load, "type") == "audiogroup_load" {
	if ds_map_find_value(async_load, "group_id")==audiogroup_music {
		audio_play_sound(mus_gameplay,100,true);	//Play music on load
	}
}
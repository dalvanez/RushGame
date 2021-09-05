/// @description Set Window Size
if (os_browser!=browser_not_a_browser) {
	window_set_size(960,960);
	surface_resize(application_surface,540,960);
}

audio_group_load(audiogroup_music);

randomize();
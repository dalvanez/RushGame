/// @description Cycle colors
if (index>=array_length(colors)) index = 0;
layer_background_blend(stars,colors[index++]);
alarm[0] = cycle_speed;
/// @description Draw Independent of Physics
var _sw = sprite_width/2;
var _sh = (sprite_height+8)/2;
if (!destroyed) draw_sprite_ext(spr_alien,passenger.index,x,y,1,1,ship_angled,passenger.color,image_alpha);
draw_sprite_ext(spr_ship_drill,image_index,x,y,image_xscale,image_yscale,ship_angled,image_blend,image_alpha);
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,ship_angled,image_blend,image_alpha);
draw_sprite_ext(spr_ship_dome,damage,x,y,image_xscale,image_yscale,ship_angled,image_blend,image_alpha);
if (invulnerability>0 && !destroyed) {
	if (thrusting<=0)	draw_set_color(c_white);
	else				draw_set_color(c_red);
	for (var i = 0; i < 6; i++) {
		var _l = i*.5;
		draw_ellipse(x-_sw-_l-1,y-_sh-_l,x+_sw+_l,y+_sh+_l,true);
	}
}
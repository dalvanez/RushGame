//@function				show_scorecard();
//@description			Creates a scorecard with the amount at the position.
function show_scorecard(_x, _y, num) {
	with instance_create_layer(_x,_y,"FX",obj_fx_scorecard) {
		amount = num;
	}
}

//@function				give_score();
//@description			Awards score and creates a scorecard.
function give_score(amount,_x,_y) {
	if (is_undefined(_x)) {
		if !is_undefined(x) _x = x;
		else				_x = -100;
	}
	
	if (is_undefined(_y)) {
		if !is_undefined(y) _y = y;
		else				_y = -100;
	}
	
	score+=amount;
	show_scorecard(x,y,amount);
}
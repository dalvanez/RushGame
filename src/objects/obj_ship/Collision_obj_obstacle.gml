/// @description Take Damage
if (thrusting<=0) ship_damage(1);
else {
	combo++;
	give_score(other.reward*combo,other.x,other.y);
	instance_destroy(other);
}
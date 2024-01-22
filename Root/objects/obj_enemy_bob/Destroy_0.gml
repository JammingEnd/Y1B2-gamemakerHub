/// @description Insert description here
// You can write your code in this editor

instance_create_depth(x+random_range(-100, 100), y+random_range(-100, 100), -y, obj_item_drop);
//if(random(4) >= 2){
//instance_create_depth(x+random_range(-25, 25), y+random_range(-25, 25), -y, obj_rat_tail);}
global.current_enemy_count--
global.current_rat_count--

OnDeath(obj_enemy_bob);





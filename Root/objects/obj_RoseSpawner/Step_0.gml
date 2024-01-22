/// @description Insert description here
// You can write your code in this editor


if global.total_rose_spawned  < (spawnMax*global.enemy_multi)
{
	//create enemy
	instance_create_depth(random_range(300,4900),random_range(300,4900), depth-1, obj_rose);
}







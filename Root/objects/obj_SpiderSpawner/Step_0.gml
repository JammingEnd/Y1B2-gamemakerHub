/// @description Insert description here
// You can write your code in this editor

timer++;

//reset timer if max number reached
//if instance_number(obj_enemy_parent) >= global.activeEnemyMax
//{
//timer = 0;
//}

if timer >= spawnTime-(15*global.enemy_multi) && global.total_spider_spawned < (spawnMax*global.enemy_multi)
{
	//create enemy
	var _inst = instance_create_depth(x,y, depth-1, obj_enemy_pop);
	with (_inst)
	{
	//make ebemy invisible
	image_alpha = 0;
	 state = -1;
	}
	//reset the timer
	timer = 0;
}







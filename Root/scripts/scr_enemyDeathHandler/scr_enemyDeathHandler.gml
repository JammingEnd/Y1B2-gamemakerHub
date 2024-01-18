// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function OnDeath(enemyType)
{
	if(enemyType == obj_enemy_bob)
	{
		if(random(4) >= 3)
		{
			add_to_inventory("Rat_Tail");
		}
	}
	if(enemyType == obj_enemy_pop)
	{
		if(random(4) >= 3)
		{
			add_to_inventory("Spider_Eye");
		}
	}
}
//draw the weapon behind player layer
if aimDir >= 0 && aimDir < 180 && gun = 1
	{
	draw_my_weapon()
	}

//draw the player
draw_self();

if gun = 1{
//draw weapon
if aimDir >= 180 && aimDir < 360
	{
		draw_my_weapon()
	}
}
	
//draw hp as number
//draw_text(x, y-50, "EnemyCount:" + string(global.current_enemy_count));
//draw_text(x, y +0, "Duck Count:" + string(global.DuckCount));

//give hp UI hp values
obj_player_health.option[0,0] = (string(hp)+"/"+string(maxHp));
obj_player_health.hpMath = hp/maxHp;

//draw_text(x, y+70, "Enemy Bullet:" + string(instance_number(obj_enemy_bullet)));
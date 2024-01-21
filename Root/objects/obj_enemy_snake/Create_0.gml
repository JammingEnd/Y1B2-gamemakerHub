//inherint the par event
event_inherited();
global.total_snake_spawned++
global.current_snake_count++
global.current_enemy_count++
global.total_enemy_spawned++
spd = 2;
chaseSpd = 5;
dir = 0;
xspd = 0;
yspd = 0;
timer = 0;

face = 1;

//state machine
state = 0;
	//shooting state
	cooldownTime = 2*60;
	shootTimer = irandom( cooldownTime );
	windupTime = 15;
	recoverTime = 45;
	bulletInst = noone;
	
bulletXoffset = -40;
bulletYoffset = 80;
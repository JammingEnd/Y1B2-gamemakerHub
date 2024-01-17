//inherint the par event
event_inherited();
global.total_rat_spawned++
global.current_rat_count++
global.current_enemy_count++
global.total_enemy_spawned++

spd = 4;
chaseSpd = 8;
dir = 0;
xspd = 0;
yspd = 0;

face = 1;

//state machine
state = 0;
//inherint the par event
event_inherited();

spd = 2;
chaseSpd = 4;
dir = 0;
xspd = 0;
yspd = 0;

face = 1;

//state machine
state = 0;
	//shooting state
	cooldownTime = 3*60;
	shootTimer = irandom( cooldownTime );
	windupTime = 60;
	recoverTime = 45;
	bulletInst = noone;
	
bulletXoffset = 0;
bulletYoffset = -sprite_height;
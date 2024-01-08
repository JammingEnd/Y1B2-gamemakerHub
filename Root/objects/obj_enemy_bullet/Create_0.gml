// Inherit the parent event
event_inherited();

dir = 0;
spd = 16;
xspd = 0;
yspd = 0;
hitConfirm = false;
//state machine
state = 0;
//0 = not moving, aim player and wait enemy to shoot (telegraph attack)

//1 = shoot the load

//cleanup
destroy = false;
hitConfirm = false;
playerDestroy = true;



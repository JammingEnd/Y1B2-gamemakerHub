//state machine
switch ( state )
{
	//chase state
	case 0:
	//chase player
	if instance_exists(obj_player)
	{dir = point_direction(x, y, obj_player.x, obj_player.y);}
	spd = chaseSpd
	break;
	
	//pause
	case 1:
	if instance_exists(obj_player)
	{dir = point_direction(x, y, obj_player.x, obj_player.y);}
	//set speed
	spd = 0;
	
	//stop animating/set image index
	image_index = 0;
	
	break;
}

// get speeds
xspd = lengthdir_x(spd, dir);
yspd = lengthdir_y(spd, dir);

//chase player
if instance_exists(obj_player)
dir = point_direction(x, y, obj_player.x, obj_player.y);

// get the correct face
 if dir > 90 && dir < 270
 {
 face =  -1;
 }else{face = 1;}

//collisions
if place_meeting(x +xspd, y, Obj_par_walls) || place_meeting(x +xspd, y, obj_enemy_parent)
{
 xspd = 0;
}
if place_meeting(x, y + yspd, Obj_par_walls) || place_meeting(x, y + yspd, obj_enemy_parent)
{
 yspd = 0;
}

//moving
x += xspd;
y += yspd;

//set depth 

depth = -y;

//inherint the par event
	//getting damaged and dying
	event_inherited();


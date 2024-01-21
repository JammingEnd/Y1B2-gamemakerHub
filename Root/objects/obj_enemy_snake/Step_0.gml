//state machine
switch ( state )
{
	
	case -1:
	
	//fade in
	if image_alpha < 1
	{
	 spd = 0
	 damage = 0;
	 image_alpha += fadeSpd;
	}else{
		state = 0;
		damage = 2;
	}
	
	//chase state
	case 0:
	//chase player
	if instance_exists(obj_player){
	dir = point_direction(x, y, obj_player.x, obj_player.y);}
	image_alpha = 1
	//chase player
	if instance_exists(obj_player)
	{dir = point_direction(x, y, obj_player.x, obj_player.y);}
	spd = chaseSpd
	
	//transition to shoot state
	var _camLeft = camera_get_view_x (view_camera[0]);
	var _camRight = _camLeft + camera_get_view_width( view_camera[0]);
	var _camTop = camera_get_view_y(view_camera[0]);
	var _camBottom = _camTop + camera_get_view_height(view_camera[0]);
	
	// only add to timeer if onscreen
	if bbox_right > _camLeft && bbox_left < _camRight && bbox_bottom > _camTop && bbox_top < _camBottom
	{shootTimer++;};
	
	if shootTimer > cooldownTime
	{
	// go to shoot state
	state = 1;
	//reset timer so the shooting state can use it too
	shootTimer = 0;
	}
	break;
	
	//pause & shoot
	case 1:
	
	//stop animating/set image index
	image_index = 0;
	
	
	//shoot bullet
	shootTimer++;
	
	
	//shoot self after  the windup time is over
	if shootTimer == windupTime
	{
		spd = 15
	}
	
	//recover and return to chasing the player
	if shootTimer > windupTime + recoverTime
	{
	 //go back to chasing the player
	 state = 0;
	 shootTimer = 0;
	}
	
	break;
}

// get speeds
xspd = lengthdir_x(spd, dir);
yspd = lengthdir_y(spd, dir);

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

if (place_meeting(x,y,obj_enemy_snake)) {timer++}else{timer = 0};

if (timer >= 180){y-=random_range(-640, 640); };
if (timer >= 180){x-=random_range(-640, 640); timer = 0;};

//set depth 

depth = -y;

//inherint the par event
	//getting damaged and dying
	event_inherited();
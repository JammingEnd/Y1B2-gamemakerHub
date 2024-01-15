//state machine
switch ( state )
{
	
	case -1:
	
	//fade in
	if image_alpha < 1
	{
	 image_alpha += fadeSpd;
	}
	break;
	//chase state
	case 0:
	
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
	if instance_exists(obj_player)
	{dir = point_direction(x, y, obj_player.x, obj_player.y);}
	//set speed
	spd = 0;
	
	//stop animating/set image index
	image_index = 0;
	
	
	//shoot bullet
	shootTimer++;
	
	if shootTimer == 1
	{
		bulletInst = instance_create_depth(x + bulletXoffset*face, y + bulletYoffset, depth, obj_enemy_bullet);
	}
	
	//keep the bullet in hands
	if shootTimer <= windupTime && instance_exists(bulletInst)
	{
	bulletInst.x = x + bulletXoffset*face;
	bulletInst.y = y + bulletYoffset;
	}
	
	//shoot the bullet after  the windup time is over
	if shootTimer == windupTime && instance_exists ( bulletInst )
	{
		//set bullet state to move
		bulletInst.state = 1;
	}
	
	//recover and return to chasing the player
	if shootTimer > windupTime + recoverTime
	{
	 //go back to chasing the player
	 state = 0;
	 //reset the timer to shoot again
	 shootTimer = 0;
	}
	
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


// state machine
switch(state)
{
	//wait for enemy to shoot state
	case 0:
		
		//aim for the player
		if instance_exists(obj_player)
		{
		 dir = point_direction(x, y, obj_player.x, obj_player.centerY)
		}
		//set depth to make self visible
		depth = -y - 50;
	break;
	
	//shoot & travel
	case 1:
	
		//movement
		xspd = lengthdir_x(spd, dir);
		yspd = lengthdir_y(spd, dir);
		x += xspd;
		y += yspd;
		
		//update depth
		depth = - y;

}

//clean up
//out of room bound
var _pad = 160;
if bbox_right < -_pad || bbox_left > room_width + _pad || bbox_bottom < 0 - _pad || bbox_top > room_height + _pad
{
	destroy = true;
}

//player colission
if hitConfirm == true && playerDestroy == true {destroy = true;};

//actual destroy
if destroy = true {instance_destroy();};

//wall colide
if place_meeting (x, y, Obj_par_walls) {destroy = true;};


image_angle = dir




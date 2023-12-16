//move

xspd =lengthdir_x(spd, dir);
yspd = lengthdir_y(spd, dir);

x += xspd;
y += yspd;


//clean up
	//destroy
	if destroy = true
	{
		//can add vfx
		instance_destroy();
	}

	//collision
	if place_meeting(x, y, Obj_par_walls) {destroy = true;}
	
	//bullet out of range
	if point_distance(xstart, ystart, x, y) > maxDist {destroy = true;}
	
	
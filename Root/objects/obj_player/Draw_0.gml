//draw the weapon behind player layer
if aimDir >= 0 && aimDir < 180 
	{
	draw_my_weapon()
	}

//draw the player
draw_self();

//draw weapon
if aimDir >= 180 && aimDir < 360
	{
		draw_my_weapon()
	}
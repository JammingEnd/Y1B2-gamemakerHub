// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_my_weapon()
{
	//draw the weapon
	//get the weapon away from player body
	var _xoffset = lengthdir_x(weaponoffsetDist, aimDir);
	var _yoffset = lengthdir_y(weaponoffsetDist,aimDir);
	//flip the weapon spprite based on aim
	var _weaponYscl = 1;
	if aimDir > 90 && aimDir < 270
	{
		_weaponYscl = -1;
	}
	draw_sprite_ext(spr_wand, 0, x + _xoffset, centerY + _yoffset, 1, _weaponYscl, aimDir, c_white, 1);
}
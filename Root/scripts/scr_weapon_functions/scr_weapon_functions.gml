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
	draw_sprite_ext(weapon.sprite, 0, x + _xoffset, centerY + _yoffset, 1, _weaponYscl, aimDir, c_white, 1);
}

//constructor template for weapons
function create_weapon( _sprite = spr_wand, _length = 0, _bulletobj = obj_bullet, _cooldown = 1, _bulletNum = 1, _spread = 0) constructor
{
	sprite = _sprite;
	length = _length;
	bulletObj = _bulletobj;
	cooldown = _cooldown;
	bulletnum = _bulletNum;
	spread = _spread;
}


//The Player's weapon inventory
global.PlayerWeapons = array_create(0);


// the weapons
global.WeaponList = {
// sprite, barrel length, bullet, speed, bullet num, spread
basicwand : new create_weapon( 
		spr_wand,
		sprite_get_bbox_right(spr_wand) - sprite_get_xoffset(spr_wand),
		obj_bullet,
		9,
		1,
		0
		),

yellowwand : new create_weapon( 
		spr_wand_yellow,
		sprite_get_bbox_right(spr_wand_yellow) - sprite_get_xoffset(spr_wand_yellow),
		obj_skinny_bullet,
		3,
		1,
		0
		), 
		
redwand : new create_weapon( 
		spr_wand_red,
		sprite_get_bbox_right(spr_wand_red) - sprite_get_xoffset(spr_wand_red),
		obj_star_bullet,
		16,
		8,
		30
		), 

}
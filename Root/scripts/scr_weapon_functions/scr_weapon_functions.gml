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
	draw_sprite_ext(weapon.sprite, 0, x + _xoffset, centerY + _yoffset, 1, _weaponYscl, aimDir, c_white, image_alpha);
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
		12,
		1,
		0
		),

yellowwand : new create_weapon( 
		spr_wand_yellow,
		sprite_get_bbox_right(spr_wand_yellow) - sprite_get_xoffset(spr_wand_yellow),
		obj_skinny_bullet,
		6,
		1,
		0
		), 
		
redwand : new create_weapon( 
		spr_wand_red,
		sprite_get_bbox_right(spr_wand_red) - sprite_get_xoffset(spr_wand_red),
		obj_star_bullet,
		24,
		8,
		30
		), 

}

//damage calculations
	//damage create event
function get_damaged_create(_hp, _iframes = false)
	{
		maxHp = _hp;
		 hp = _hp;

		if _iframes == true
		{
		iframeTimer = 0;
		iframeNumber = 90;
		}
		//create the damage list
		if _iframes == false
		{
		damageList = ds_list_create();
		}
	}
	
//damage clean up event
function get_damaged_cleanup()
	{
		//DO NOT NEED if using iframes
		
		ds_list_destroy(damageList);
	}
	
	
	//damage step event
function get_damaged(_damageObj, _iframes = false)
{
	//exit for iframe timer
	if _iframes == true && iframeTimer > 0
	{
	iframeTimer--;
	
	//if iframeTimer is divisible by 4, activate image alpha toggle, toggle every mod num frames
	if iframeTimer mod 5 == 0{
		if image_alpha == 1{image_alpha = 0.3;}else{image_alpha = 1;}
	}
	
	//clamp hp
	hp = clamp(hp, 0, maxHp);
	
	//terminate rest of code
	exit;
	}
	
	//make sure the iframe blink stops
	if _iframes == true {image_alpha = 1;}
	
	//receive damage
	//this only registers one bullet per frame
	if place_meeting (x, y, _damageObj)
	{
		//getting a list of the damage instances
			//creating ds list
		var _instList = ds_list_create();
			//copying instance id of every obj_damage_enemy(bullets) 
		instance_place_list(x, y, _damageObj, _instList, false);
	
		//get the size of our list (to loop through it)
		var _listSize = ds_list_size(_instList);
		//loop through every single entry of ds list
			
			var _hitConfirm = false;
			for (var i = 0; i < _listSize; i++ )
			{
				//get a damage object instance from list
			 var _inst = ds_list_find_value(_instList, i);
	 
	 
				//check if these instances are already in the damage list so it won't damage again
				if _iframes == true || ds_list_find_index( damageList, _inst ) == -1
				{
					if _iframes == false
					{
						//add the new damage instance to the damage list
						ds_list_add (damageList, _inst);
					}
					 //take damage from specific instance & apply damage
					 hp -= _inst.damage;
					 _hitConfirm = true;
					 //tell the damage instance it has inpacted = to be detroyed
					 _inst.hitConfirm = true;
				}
	 
			}
		//set iframes if we were hit
		if _iframes == true && _hitConfirm == true
		{
			iframeTimer = iframeNumber;
		}
		// free memory by destroying ds list
		ds_list_destroy(_instList);
	}

	 //clear the damage list of obj that doesnt exist or arnt touching anymore
if _iframes == false {
	 var _damageListSize = ds_list_size(damageList);
		 for(var i = 0; i < _damageListSize; i++)
		 {
			//if not touching the damage instance anymore, 
			//remove it from the list AND set loop back to 1st position to keep checking
			var _inst = ds_list_find_value(damageList, i);
			if !instance_exists(_inst) || !place_meeting (x, y, _inst)
			{
				ds_list_delete(damageList, i);
				i--;
				_damageListSize--;
			}
		 }
	}
	
	//clamp hp
	hp = clamp(hp, 0, maxHp);
	 
}
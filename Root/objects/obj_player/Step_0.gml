// check keys for movement
if (global.playerControl == true)
{
moveRight = global.rightKey
moveLeft = global.leftKey
moveUp = global.upKey
moveDown = global.downKey
shootkey = global.shootKey
swapKeyPressed = global.swapKeyPressed
}

//check shoot


// calculate movement
vx = ((moveRight - moveLeft) * walkSpeed);
vy = ((moveDown - moveUp) * walkSpeed);

//calc HP
plHp = 10 + global.HpValue

//trigger to prevent PC movement
if (global.playerControl == false)
{
	moveRight = 0;
	moveUp = 0;
	moveLeft = 0;
	moveDown = 0;
}
	
#region //player movement
	//get the directions
	var _horizkey = moveRight - moveLeft;
	var _vertkey = moveDown - moveUp;
	dir = point_direction(0, 0, _horizkey, _vertkey);
	
	//get the x and y speeds
	var _spd = 0;
	var _inputlevel = point_distance(0, 0, _horizkey, _vertkey);
	 _inputlevel = clamp(_inputlevel, 0, 1);
	_spd = walkSpeed * _inputlevel;
	
	vx = lengthdir_x(_spd, dir);
	vy = lengthdir_y(_spd, dir);

// If Idle
if (vx == 0 && vy == 0)
{
	myState = playerState.idle;	
}

// If moving and if there are no walls
if (vx != 0 || vy != 0)
{
	if !collision_point(x+vx,y,Obj_par_walls,true,true) && !collision_point(x+vx,y,obj_par_npc,true,true) && !collision_point(x+vx,y,obj_soft_wall,true,true)
	{
		x += vx;
	}
	if !collision_point(x,y+vy,Obj_par_walls,true,true) && !collision_point(x,y+vy,obj_par_npc,true,true)  && !collision_point(x,y+vy,obj_soft_wall,true,true)
	{
		y += vy;
	}
}
#endregion	

#region // Sprite Control

	//player aiming
	centerY = y + centerYoffset;
	
	//aim
	aimDir = point_direction(x, centerY, mouse_x, mouse_y);

	//make sure player is facing correct direction
	//face = round(dir/90);
		face = round(aimDir/90);
		if face == 4 {face = 0;};
	
	//animate
		if vx == 0 && vy == 0
		{
			image_index = 0;
		}
	
	//Set the player sprite
		mask_index = playerSpr[playerState.idle][3];
		sprite_index = playerSpr[playerState.idle][face];

#endregion

#region//weapon swapping
	var _playerWeapons = global.PlayerWeapons;
	
	//cycle through weapons
	if swapKeyPressed
	{
		//change the selecetion
		selectedWeapon++;
		//so it won't crash trying to acess array option that doesn't exist
		if selectedWeapon >= array_length(_playerWeapons) {selectedWeapon = 0;};
		//set the new weapon
		weapon = _playerWeapons[selectedWeapon];
	}
#endregion

#region//shoot the weapon
if shootTimer > 0 {shootTimer--;};
if shootkey && shootTimer <= 0
{
	//reset the timer
	shootTimer = weapon.cooldown/(global.FireRateValue+1);
	
	//create bullet
	var _xoffset = lengthdir_x(weapon.length + weaponoffsetDist, aimDir);
	var _yoffset = lengthdir_y(weapon.length + weaponoffsetDist, aimDir);
	var _spread = weapon.spread;
	//dont divide by bullet number spaces between bullet
	//var _spreadDiv = _spread / weapon.bulletnum;
	var _spreadDiv = _spread / max(weapon.bulletnum - 1, 1);
	//run loop code untill i equals bullet num (creates correct number of bullets)
	for (var i = 0; i < weapon.bulletnum; i++)
	{
		var _bulletInst = instance_create_depth(x + _xoffset, centerY + _yoffset, depth-999999, weapon.bulletObj);
	
		//change bullet direction
		with(_bulletInst)
		{
			dir = other.aimDir - _spread/2 + _spreadDiv*i;
			//turn bullet to correct dir upon birth if needed
			if dirFix == true
			{
			image_angle = dir;
			}
			
		}
		
	}
}
#endregion
#region // Setting pickup audio position if Sequence is playing
if (instance_exists(obj_control) && obj_control.sequenceState == seqState.playing)
	{
		var _camX = camera_get_view_x(view_camera[0])+floor(camera_get_view_width(view_camera[0])*0.5);
		var _camY = camera_get_view_y(view_camera[0])+floor(camera_get_view_height(view_camera[0])*0.5);
		
		audio_listener_set_position(0,_camX,_camY,0);
	}
	else
	{
		// Otherwise, move audio listener with me
		audio_listener_set_position(0,x,y,0);
	}
#endregion

#region// Check for collision with NPCs and prompt pop-up
nearbyNPC = collision_rectangle(x-lookRange,y-lookRange,x+lookRange,y+lookRange,obj_par_npc,false,true);
if nearbyNPC {
// Pop up prompt
if (npcPrompt == noone || npcPrompt == undefined) {
}
//where the prompt pops up +debug message
npcPrompt = scr_showPrompt(nearbyNPC,nearbyNPC.x,nearbyNPC.y-nearbyNPC.sprite_height);
show_debug_message("obj_player has found an NPC!");
}
if !nearbyNPC {
// Get rid of prompt
scr_dismissPrompt(npcPrompt,0);
}
#endregion
// Depth sorting
depth = -bbox_bottom;

//get damaged by, have invincibility frames
get_damaged(obj_damage_player, true);

//death / Game over
if hp <= 0 
{
	//create game over screen
	instance_create_depth(0, 0, 0, obj_game_over);
	//destroy ourself
	instance_destroy();
	exit;
}

// check keys for movement
if (global.playerControl == true)
{
leftkey = keyboard_check(vk_right) || keyboard_check(ord("D"));
rightkey = keyboard_check(vk_left) || keyboard_check(ord("A"));
upkey = keyboard_check(vk_up) || keyboard_check(ord("W"));
downkey = keyboard_check(vk_down) || keyboard_check(ord("S"));
}

//trigger to prevent PC movement
if (global.playerControl == false)
{
	leftkey = 0;
	rightkey = 0;
	upkey = 0;
	downkey = 0;
}
	
//player movement
	//get the directions
	var _horizkey = rightkey - leftkey;
	var _vertkey = downkey - upkey;
	moveDir = point_direction(0, 0, _horizkey, _vertkey);
	
	//get the x and y speeds
	var _spd = 0;
	var _inputlevel = point_distance(0, 0, _horizkey, _vertkey);
	 _inputlevel = clamp(_inputlevel, 0, 1);
	_spd = moveSpd * _inputlevel;
	
	xspd = lengthdir_x(_spd, moveDir);
	yspd = lengthdir_y(_spd, moveDir);
	
	//collision
	if place_meeting( x + xspd, y, obj_wall)
	{
		xspd = 0;
	}
	if place_meeting( x, y + yspd, obj_wall)
	{
		yspd = 0;
	}
	
	//move the player
	x += xspd;
	y += yspd;


#region // Change sprite based on movement
	if (xspd > 0)
	{
		dir = 0;
	}
	if (xspd < 0)
	{
		dir = 2;
	}	
	if (yspd > 0)
	{
		dir = 3;
	}
	if (yspd < 0)
	{
		dir = 1;
	}

// If Idle
if (xspd == 0 && yspd == 0)
{
	myState = playerState.idle;	
}
#endregion


// Check for collision with NPCs
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

// Depth sorting
depth = -y;
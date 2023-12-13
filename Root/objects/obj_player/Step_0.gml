// check keys for movement
if (global.playerControl == true)
{
moveRight = keyboard_check(vk_right);
moveLeft = keyboard_check(vk_left);
moveUp = keyboard_check(vk_up);
moveDown = keyboard_check(vk_down);
}

// calculate movement
vx = ((moveRight - moveLeft) * walkSpeed);
vy = ((moveDown - moveUp) * walkSpeed);

//trigger to prevent PC movement
if (global.playerControl == false)
{
	moveRight = 0;
	moveUp = 0;
	moveLeft = 0;
	moveDown = 0;
}
	
// Run with Shift key
running = keyboard_check(vk_shift);

// Speed up if running
if (running == true)
{
	// Ramp up
	if (runSpeed < runMax)
	{
		runSpeed += 2;
	}
	// Start creating dust
	if (startDust == 0)
	{
		alarm[0] = 2;
		startDust = 1;
	}
}
// Slow down if no longer running
if (running == false)
{
	// Ramp down
	if (runSpeed > 0)
	{
		runSpeed -= 1;
	}
	startDust = 0;
}

// If Idle
if (vx == 0 && vy == 0)
{
	myState = playerState.idle;	
}

// If moving
if (vx != 0 || vy != 0)
{
	if !collision_point(x+vx,y,Obj_par_walls,true,true) && !collision_point(x+vx,y,obj_par_npc,true,true)
	{
		x += vx;
	}
	if !collision_point(x,y+vy,Obj_par_walls,true,true) && !collision_point(x,y+vy,obj_par_npc,true,true)
	{
		y += vy;
	}
	
	// Change direction based on movement
	if (vx > 0)
	{
		dir = 0;
	}
	if (vx < 0)
	{
		dir = 2;
	}	
	if (vy > 0)
	{
		dir = 3;
	}
	if (vy < 0)
	{
		dir = 1;
	}

	// If Idle
if (vx == 0 && vy == 0) {
// Change idle Sprite based on last direction
switch dir {
case 0: sprite_index = spr_player_idle_right; break;
case 1: sprite_index = spr_player_idle_up; break;
case 2: sprite_index = spr_player_idle_left; break;
case 3: sprite_index = spr_player_idle_down; break;
}
}



		
	// Setting pickup audio position if Sequence is playing
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
}
	
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

// Auto-choose Sprite based on state and direction
sprite_index = playerSpr[myState][dir];

// Depth sorting
depth = -y;
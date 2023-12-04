// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_DoorScript(){

}

global.UseDoor = function UseDoor(targetX, targetY, targetRoom)
{
	room_goto(targetRoom);
	obj_player.x = targetX;
	obj_player.y = targetY;
}
/// @description Insert description here
// You can write your code in this editor
timer++

if (global.current_enemy_count <= 0 && timer >= 300) 
{
	obj_player_roomtimer.timeactive = 0;
	instance_destroy();
};

switch ( state )
{
	case -1:
	if image_alpha < 1
	{
	 image_alpha += fadeSpd;
}
}
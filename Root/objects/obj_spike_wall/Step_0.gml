/// @description Insert description here
// You can write your code in this editor

if object_exists(obj_enemy_bob) || object_exists(obj_enemy_pop) 
{state = -1;}else{state = 0;};

switch ( state )
{
	case -1:
if image_alpha < 1
	{
	 image_alpha += fadeSpd;
	}
	
	case 0:
	image_alpha -= fadeSpd;
	if image_alpha = 0{instance_destroy()};
}







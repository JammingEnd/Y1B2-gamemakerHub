/// @description Insert description here
// You can write your code in this editor


//create text & text box & positioning
					
if (!instance_exists(obj_menu))
			{
				instance_create_depth(camera_get_view_x(0), camera_get_view_y(0), -10000, obj_menu);
				global.playerControl = false;
			}




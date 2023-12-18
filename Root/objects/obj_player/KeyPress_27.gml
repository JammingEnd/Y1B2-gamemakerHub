/// @description open menu
// You can write your code in this editor



if (!instance_exists(obj_menu))
			{
				instance_create_depth(camera_get_view_x(0), camera_get_view_y(0), -10000, obj_menu);
				instance_create_depth(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2 - 1920/2, y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2 - 1080/2, -10000, obj_menu);
				global.playerControl = false;
			}









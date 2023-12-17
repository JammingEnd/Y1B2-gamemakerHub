//get the camera's width and height
var _camW = camera_get_view_width(view_camera[0]);
var _camH = camera_get_view_height(view_camera[0]);

//center on the player
if instance_exists(obj_player)
{
x = obj_player.x - _camW/2;
y = obj_player.centerY - _camH/2;
}


//clamp cam position to room borders
x = clamp(x, 0, room_width - _camW);
y = clamp(y, 0, room_height - _camH);

//set camera position
camera_set_view_pos(view_camera[0], x, y);





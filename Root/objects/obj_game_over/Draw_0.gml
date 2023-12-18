//get accept key
acceptKey = global.acceptKey;

var _camX = camera_get_view_x(view_camera[0]);
var _camW = camera_get_view_width(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);
var _camH = camera_get_view_height(view_camera[0]);

//draw black rectangle over screen
draw_set_alpha(alpha*alphaMax);
draw_rectangle_color (_camX, _camY, _camX + _camW, _camY + _camH, c_black, c_black, c_black, c_black, false)

//draw text
//"game over"
var _gameoveroffset = -160;
draw_set_font(fnt_basic_font);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_alpha(alpha);
draw_text_transformed (_camX + _camW/2, _camY + _camH/2 + _gameoveroffset, "Game Over", 4, 4, 0);


//"press space to restart"
var _restartoffset = 400;
draw_text_transformed(_camX + _camW/2, _camY + _camH/2 + _restartoffset, "|| Press Space to Restart ||", 2, 2, 0);
//reset draw settings
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_alpha(1);

//restart
if acceptKey && alpha >= 1
{
	room_restart();
	if !instance_exists(obj_player)
	{instance_create_depth (2600, 300, 0, obj_player);};
	instance_destroy (obj_game_over)
}
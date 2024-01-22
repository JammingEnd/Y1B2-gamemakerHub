/// @description Draw background
draw_self();
depth = -9999999
//Define font
draw_set_font(global.font_main);
//follow camera
textbox_x = camera_get_view_x(view_camera[0]);
textbox_y = camera_get_view_y(view_camera[0]);

//dynaamically get width/hight of menu

//Cords where to spawn
x = camera_get_view_x(view_camera[0]);
y = camera_get_view_y(view_camera[0]);

//draw only when entering arena
if obj_player_roomtimer.transparent = 1{scale = 2}else{scale = 1}

//draw menu back ground
draw_sprite_ext(spr_healthline , image_index, x+10, y+10, 0.2*scale, 0.2*scale, 0, c_white, 1);

//draw the options
draw_set_valign(fa_top);
draw_set_halign(fa_left);

if object_exists(obj_player){
	 var _c = c_black;
	 var _r = c_red;
	 draw_text_transformed_color(x+(155*scale), (y+40*scale), option[0, 0], scale, scale, 0, _r, _r, _r, _r, 1);
	 draw_text_transformed_color(x+(155*scale), (y+40*scale), option[0, 0], scale, scale, 0, _c, _c, _c, _c, hpMath);
}
/// @description Draw background
draw_self();
depth = -9999999
//Define font
draw_set_font(global.font_main);
//follow camera
textbox_x = camera_get_view_x(view_camera[0]);
textbox_y = camera_get_view_y(view_camera[0]);

//dynaamically get width/hight of menu
var _new_w = 0;
for (var i = 0; i < op_length; i++)
 {
	 var _op_w = string_width(option[menu_level, i]);
	 _new_w = max(_new_w, _op_w);
 }
 
width = _new_w + op_border*2;
height = op_border*2 + string_height(option[0, 0]) + (op_length-1)*op_space;

//Cords where to spawn
x = camera_get_view_x(view_camera[0]) + (1890 - width);
y = camera_get_view_y(view_camera[0]) +30;

//draw menu back ground
draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_white, 1);

//draw the options
draw_set_valign(fa_top);
draw_set_halign(fa_left);

for (var i = 0; i < op_length; i++)
 {
	 var _c =  #2d2835;
	 if pos == i{_c =  #2d2835}
	 draw_text_transformed_color(x+op_border, y+op_border+op_space*i, option[menu_level, i], 1, 1, 0, _c, _c, _c, _c, 1);
 }
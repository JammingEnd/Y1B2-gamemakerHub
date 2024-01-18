/// @description Draw background
draw_self();
depth = -9999999
//Define font
draw_set_font(global.font_main);
//follow camera
textbox_x = camera_get_view_x(view_camera[0]);
textbox_y = camera_get_view_y(view_camera[0]);
//pipi



var itemList = ds_list_create();

for(i = 0; i < ds_list_size(playerInventory); i++)
{
	var refID = global.playerInventory[| i];
	var readItem = refID;
	ds_list_add(itemList, ($"{readItem.itemName}: {readItem.amount}")) ;
}

op_length = ds_list_size(itemList);


//dynaamically get width/hight of menu
var _new_w = 0;
for (var i = 0; i < op_length; i++)
 {
	 var _op_w = string_width(ds_list_find_value(itemList, i));
	 _new_w = max(_new_w, _op_w);
 }
 
width = _new_w + op_border*2;
height = op_border*2 + string_height(ds_list_find_value(itemList, i)) + (op_length-1)*op_space;

//center menu
x = camera_get_view_x(view_camera[0]) +30;
y = camera_get_view_y(view_camera[0]) +400;

//draw menu back ground
draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_white, 1);

//draw the options
draw_set_valign(fa_top);
draw_set_halign(fa_left);


for (var i = 0; i < op_length; i++)
 {
	 var _c = c_white;
	 if pos == i{_c = c_white}
	 if(ds_list_size(playerInventory) == 0 )
	{
		draw_text_transformed_color(x+op_border, y+op_border+op_space*i, "", 1, 1, 0, _c, _c, _c, _c, 1);
		return;
	}
	 draw_text_transformed_color(x+op_border, y+op_border+op_space*i, ds_list_find_value(itemList, i) , 1, 1, 0, _c, _c, _c, _c, 1);
 }
  


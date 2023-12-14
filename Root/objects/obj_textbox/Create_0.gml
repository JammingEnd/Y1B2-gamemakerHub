/// @description Textbox properties
depth = -9999;

//textbox parameter
textbox_width = 1735;
textbox_height = 295;

//space between text & border
border = 80;
//space between lines
line_sep =80;
//Spacee befor creating a ne line of text
line_width = textbox_width - border*2;

//animate textbox background if any
txtb_spr = spr_menu;
txtb_img = 0;
//set speed to (animation frame rate)/(game frame rate)
txtb_img_spd = 6/60;

//the text
page = 0;
page_number = 0;
text[0] = "";
text_length[0] = string_length(text[0]);
draw_char = 0;
text_spd = 1;
textbox_x = 0;
textbox_y = 0;
accept_key = 0;
txtb_spr_w =0;
txtb_spr_h = 0;
//test
var p = 1;
text_x_offset[p] = 90;
//options
//chosen option
option[0] = "";
option_link_id[0] = -1;
//keep track of selected option
option_pos = 0;
option_number = 0;

setup = false;
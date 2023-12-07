/// @description Menu properties
// You can write your code in this editor

up_key = keyboard_check_pressed(vk_up);
down_key = keyboard_check_pressed(vk_down);
up_mouse = mouse_wheel_up()
down_mouse = mouse_wheel_down()

width = 640;
height = 860;

//op_border define distance of letter from text_box boarder
//op_space define space between the letter
op_border = 80;
op_space = 160;

//selection position
pos = 0;

//options array
option[0] = "Start game";
option[1] = "Settings";
option[2] = "Quit Game";

//keep track of number of options in options array
op_length = array_length(option);







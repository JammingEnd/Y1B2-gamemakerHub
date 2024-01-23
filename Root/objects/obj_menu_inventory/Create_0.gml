/// @description Menu properties
// You can write your code in this editor
playerInventory = global.playerInventory;

up_key = keyboard_check_pressed(vk_up);
down_key = keyboard_check_pressed(vk_down);
up_mouse = mouse_wheel_up()
down_mouse = mouse_wheel_down()

//doesnt really matter
width = 640;
height = 860;

//op_border define distance of letter from text_box boarder
//op_space define space between the letter
op_border = 70;
op_space = 60;

//selection position
pos = 0;

//pause menu
option[0, 0] = "Save game";
option[0, 1] = "Settings";
option[0, 2] = "Quit Game";

//settings menu
option[1, 0] = "Windows Full Screen";
option[1, 1] = "Brightness";
option[1, 2] = "Controls";
option[1, 3] = "Back";

//keep track of number of options in options array
op_length = 0;
menu_level = 0;

//text box properties
global.playerControl = false;
fadeMe = 0;
fadeSpeed = 0.1;
image_alpha = 0;
sequenceToShow = noone;
scale = 0;





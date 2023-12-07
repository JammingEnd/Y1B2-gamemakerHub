/// @description Insert description here
up_key = keyboard_check_pressed(vk_up);
down_key = keyboard_check_pressed(vk_down);

// move through the menu
pos += (down_key - up_key);
if pos >= op_length {pos = 0};
if pos < 0 {pos = op_length-1};



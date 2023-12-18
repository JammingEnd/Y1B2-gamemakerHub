/// @description Insert description here
// You can write your code in this editor
global.rightKey = keyboard_check(vk_right) || keyboard_check(ord("D"));
global.leftKey = keyboard_check(vk_left) || keyboard_check(ord("A"));
global.upKey = keyboard_check(vk_up) || keyboard_check(ord("W"));
global.downKey = keyboard_check(vk_down) || keyboard_check(ord("S"));
global.shootKey = mouse_check_button(mb_left);
global.swapKeyPressed = mouse_check_button_pressed(mb_right);
global.acceptKey = keyboard_check(vk_space);







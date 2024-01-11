/// @description Menu properties
// You can write your code in this editor
//doesnt really matter
width = 640;
height = 860;

//op_border define distance of letter from text_box boarder
//op_space define space between the letter
op_border = 35;
op_space = 50;

//selection position
pos = 0;
global.DamageValue = 0;
global.FireRateValue = 0;
global.HpValue = 10;
//pause menu
option[0, 0] = ("Damage: x" + string(global.DamageValue));
option[0, 1] = ("FireRate: x" + string(global.FireRateValue));
option[0, 2] = ("HP:" + string(global.HpValue));

//keep track of number of options in options array
op_length = 0;
menu_level = 0;

fadeMe = 0;
fadeSpeed = 0.1;
image_alpha = 0;
sequenceToShow = noone;





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
global.LevelTimerMin = 0;
global.LevelTimerSec = 0;
global.LevelTimerMilsec = 0;
global.TotalTime = 0;

transparent = 0;

//pause menu
option[0, 0] = ("Timer: " + string(global.LevelTimerMin)+":" + string(global.LevelTimerSec)+":"+string(global.LevelTimerMilsec));

//keep track of number of options in options array
op_length = 0;
menu_level = 0;

fadeMe = 0;
fadeSpeed = 0.1;
image_alpha = 0;
sequenceToShow = noone;





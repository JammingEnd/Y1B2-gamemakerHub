//store number of options in current menu
op_length = array_length(option[menu_level])

option[0, 0] = ("Timer: " + string(global.LevelTimerMin)+":" + string(global.LevelTimerSec)+":"+string(global.LevelTimerMilsec));

if (transparent = 1)&&(active = 1){
global.LevelTimerMilsec++
global.TotalTime++
}

if global.LevelTimerMilsec = 60 {

global.LevelTimerMilsec = 0
global.LevelTimerSec++
obj_player_time.minut++
};

if global.LevelTimerSec = 60 {

global.LevelTimerSec = 0
global.LevelTimerMin++
};

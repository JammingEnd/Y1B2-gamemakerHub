if obj_player_roomtimer.transparent = 0 {
   obj_player_roomtimer.transparent = 1;
}else{obj_player_roomtimer.transparent = 0};

global.LevelTimerMilsec = 0;
global.LevelTimerSec = 0;
global.LevelTimerMin = 0;
global.TempMinuts = 0;
global.entered_house = 1;

UseDoor(TargetPos_x, TargetPos_y, TargetRoom);


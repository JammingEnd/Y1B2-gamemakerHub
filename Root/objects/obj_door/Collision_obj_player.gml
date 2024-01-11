var _time = global.TotalTime

if  obj_player_roomtimer.transparent = 1 {
global.DuckCount += 15000 - _time;
global.TotalTime = 0;
}

if obj_player_roomtimer.transparent = 0 {obj_player_roomtimer.transparent = 1}else{obj_player_roomtimer.transparent = 0};

global.LevelTimerMilsec = 0;
global.LevelTimerSec = 0;
global.LevelTimerMin = 0;

global.Difficulty++

UseDoor(TargetPos_x, TargetPos_y, TargetRoom);


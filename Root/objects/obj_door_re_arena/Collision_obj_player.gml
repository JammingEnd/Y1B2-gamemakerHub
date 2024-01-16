var _time = global.TotalTime

if  obj_player_roomtimer.active = 1 {
global.DuckCount += 15000 - _time;
global.TotalTime = 0;
}

obj_player_roomtimer.active = 0;
obj_player.gun = 0;

global.LevelTimerMilsec = 0;
global.LevelTimerSec = 0;
global.LevelTimerMin = 0;

UseDoor(TargetPos_x, TargetPos_y, TargetRoom);


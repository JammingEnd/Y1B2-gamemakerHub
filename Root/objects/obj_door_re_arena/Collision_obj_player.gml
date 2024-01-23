var _time = global.TotalTime

if  obj_player_roomtimer.active = 1 {
global.TotalTime = 0;
}

obj_player_roomtimer.active = 0;
obj_player.gun = 0;

global.LevelTimerMilsec = 0;
global.LevelTimerSec = 0;
global.LevelTimerMin = 0;
global.total_enemy_spawned = 0;
global.total_rat_spawned = 0;
global.total_spider_spawned = 0;
global.TempMinuts = 0;
obj_player_time.hour += 9;
global.forest_spawn = 1;
global.outofcombat = 1;

UseDoor(TargetPos_x, TargetPos_y, TargetRoom);


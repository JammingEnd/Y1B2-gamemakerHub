obj_player.gun = 1;
obj_player_time.active = 1;
obj_player_roomtimer.active = 1;
global.enemy_multi++

global.LevelTimerMilsec = 0;
global.LevelTimerSec = 0;
global.LevelTimerMin = 0;
global.entered_house = 0;
global.outofcombat = 0;

UseDoor(TargetPos_x, TargetPos_y, TargetRoom);


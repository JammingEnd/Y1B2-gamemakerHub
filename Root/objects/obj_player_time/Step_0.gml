//store number of options in current menu
op_length = array_length(option[menu_level])

if (global.LevelTimerMilsec = 60) {minut++};

if minut > 9 {minut -= 10 minuts++}
if minuts > 5 {minuts -= 6 hour++}
if hour > 9 {hour -= 10 hours++}

option[0, 0] = ( string(hours) + string(hour)+":" + string(minuts) + string(minut));

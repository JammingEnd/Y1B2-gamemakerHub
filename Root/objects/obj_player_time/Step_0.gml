//store number of options in current menu
op_length = array_length(option[menu_level])

if minut > 9 {minut -= 10 minuts++}
if minuts > 5 {minuts -= 6 hour++}
if hour > 9 {hour -= 10 hours++}
if hours = 2 && hour >= 4 {hours -= 2; hour -= 4; days++;}
else{
if hours >= 3{hours -= 2; hour -= 4; days++;}
}

if minut <= -1 {minut += 10 minuts--}
if minuts <= -1 {minuts += 6 hour--}
if hour <= -1 {hour += 10 hours--}

option[0, 0] = ( string(hours) + string(hour)+":" + string(minuts) + string(minut));

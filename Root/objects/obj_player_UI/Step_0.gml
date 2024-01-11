//store number of options in current menu
op_length = array_length(option[menu_level])

option[0, 0] = ("Damage: x" + string(global.DamageValue));
option[0, 1] = ("FireRate: x" + string(global.FireRateValue));
option[0, 2] = ("HP:" + string(global.HpValue));

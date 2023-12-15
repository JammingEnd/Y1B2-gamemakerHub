/// @description Insert description here
up_key = keyboard_check_pressed(vk_up);
down_key = keyboard_check_pressed(vk_down);
accept_key = keyboard_check_pressed(vk_space);

//store number of options in current menu
op_length = array_length(option[menu_level])

// move through the menu
pos += down_key - up_key;
if pos >= op_length {pos = 0};
if pos < 0 {pos = op_length-1};

//using the options
if accept_key {
	var _sml = menu_level;
	
	switch(menu_level) {
		
		//pause menu
		case 0:
		switch(pos) {
			//Start
			case 0: room_goto(rm_witch_home) break;
			//Settings
			case 1: menu_level = 1; break;
			//Exit
			case 2: game_end() break;
		}
		break;
		
		//settings
		case 1:
		switch(pos){
			//window size
			case 0: scr_windows_toggle();
			//brightness
			case 1: break;
			//conreols
			case 2: break;
			//back
			case 3: menu_level = 0; break;
				}
		break;
	}	
		//set position back (to look nice)
		if _sml != menu_level {pos = 0};
		
		//correct option length
		op_length = array_length(option[menu_level])
}

//useless fade effect

// Fade effects
switch fadeMe
{
	// Fade in
	case 0:
	{
		if (image_alpha < 1)
		{
			image_alpha += fadeSpeed;
		}
		if (image_alpha == 1)
		{
			fadeMe = 1;
		}
	}; break;
	// Fade out
	case 2:
	{
		if (image_alpha > 0)
		{
			image_alpha -= fadeSpeed;
		}
		if (image_alpha == 0)
		{
			fadeMe = 3;
			// Queue up destroy
			alarm[0] = 2;
		}
	}; break;
}
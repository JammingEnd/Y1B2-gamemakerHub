//store number of options in current menu
op_length = array_length(option[menu_level])

option[0, 0] = ("Rat Tail: " + string(global.rattail));
option[0, 1] = ("Spider Eye: " + string(global.spidereye));
option[0, 2] = ("Snake Skin: " + string(global.snakeskin));
option[0, 3] = ("Flower Petal: " + string(global.flowerpetal));
option[0, 4] = ("<G> Health Potion: " + string(global.healthpotion));
option[0, 5] = ("<H> Speed Potion: " + string(global.speedpotions));

//correct option length
op_length = array_length(option[menu_level])
//useless fade effect
depth = -9999999
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
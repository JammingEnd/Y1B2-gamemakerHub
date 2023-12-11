function scr_showPrompt(_object,_x,_y)
{
	if (instance_exists(_object))
	{
		if (!instance_exists(obj_textbox_old) && !instance_exists(obj_prompt))
		{
			if (obj_player.myState != playerState.puttingDown)
			{
				iii = instance_create_depth(_x,_y,-10000,obj_prompt);
				return iii;
			}
		}
	}
}
	
function scr_dismissPrompt(_whichPrompt,_toReset)
{
	if (_whichPrompt != undefined)
	{
		if (instance_exists(_whichPrompt))
		{
			// Tell prompt Object to fade out
			with (_whichPrompt)
			{
				fadeMe = "fadeOut";
			}
			// Reset appropriate prompt variable
			if (instance_exists(obj_player))
			{
				with (obj_player)
				{
					switch _toReset
					{
						// Reset npcPrompt
						case 0: npcPrompt = noone; break;
					}
				}
			}
		}
	}
}
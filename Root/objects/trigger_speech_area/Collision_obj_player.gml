/// @description Insert description here
// You can write your code in this editor

var _text, _seq;

if (global.playerControl == true)
{
			//Decide text to show
			_text = text_id;
			
				if (!instance_exists(obj_textbox)) && (!instance_exists(obj_textbox_big))
				{
					if obj_player_roomtimer.transparent = 0{
					//create text & text box & positioning
					create_textbox(_text);
					character.signal = 1;
					instance_destroy();
					}else{
					create_textbox_big(_text);
					character.signal = 1;
					instance_destroy();
					}
				}
}






	/// @description Interact with npc/object

var _text, _seq;

	// If player has control
if (global.playerControl == true)
{
	// If near an NPC
	if (nearbyNPC)
	{
		// If NPC is still available
		if (nearbyNPC.myState == npcState.normal)
		{
			if (obj_player_time.hours = 2) && (obj_player_time.hour >= 2)
			{_text = "Out of Time"}else{_text = nearbyNPC.text_id;}
			
				if (!instance_exists(obj_textbox)) && (!instance_exists(obj_textbox_big))
				{
					if obj_player_roomtimer.transparent = 0{
					//create text & text box & positioning
					 create_textbox(_text);
					}else{
					create_textbox_big(_text);
					}
				}
			
		}
		// If NPC is "done"
		if (nearbyNPC.myState == npcState.done)
		{
			_text = nearbyNPC.itemTextDone;
			if (!instance_exists(obj_textbox))
			{
				iii = instance_create_depth(nearbyNPC.x,nearbyNPC.y-400,-10000,obj_textbox);
				iii.textToShow = _text;
			}
		}
	}
		
}
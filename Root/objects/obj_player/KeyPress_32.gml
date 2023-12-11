/// @description Context-sensitive actions

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
			// If player does not have an item
			if (hasItem == noone || hasItem == undefined)
			{
				_text = nearbyNPC.myText;
				if (!instance_exists(obj_textbox))
				{
					iii = instance_create_depth(nearbyNPC.x,nearbyNPC.y-400,-10000,obj_textbox);
					iii.textToShow = _text;
				}
			}
			
			// If player has little town item (and it still exists)
			if (hasItem != noone && instance_exists(hasItem))
			{
				// If player has correct item
				if (hasItem.object_index == nearbyNPC.myItem)
				{
					_text = nearbyNPC.itemTextHappy;
					_seq = nearbyNPC.sequenceHappy;
					// Check if we should remove item, mark NPC
					alarm[1] = 10;
				}
				// Or if player has incorrect item
				else
				{
					_text = nearbyNPC.itemTextSad;
					_seq = nearbyNPC.sequenceSad;
				}
				// Create textbox
				if (!instance_exists(obj_textbox))
				{
					iii = instance_create_depth(nearbyNPC.x,nearbyNPC.y-400,-10000,obj_textbox);
					iii.textToShow = _text;
					iii.sequenceToShow = _seq;
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
		
	if (global.playerControl == true){
		if (instance_exists(obj_textbox))
				{
					//add player control
					global.playerControl = true;
				}
	}
}
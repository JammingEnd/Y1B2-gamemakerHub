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
				//Decide text to show
				_text = nearbyNPC.myText;
				if (!instance_exists(obj_textbox))
				{
					//create text & text box & positioning
					iii = instance_create_depth(nearbyNPC.x,nearbyNPC.y-400,-10000,obj_textbox);
					iii.textToShow = _text;
					//remove player control
					global.playerControl = false;
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
	
	// If near an item (Ignore remove with caution)
	if (nearbyItem && !nearbyNPC)
	{
		// If player doesn't have an item
		if (hasItem == noone || hasItem == undefined)
		{
			global.playerControl = false;
			myState = playerState.pickingUp;
			image_index = 0;
			hasItem = nearbyItem;
			// Take into account weight of the item we're picking up
			carryLimit = hasItem.itemWeight * 0.1;
			// Change state of item we're picking up
			with (hasItem)
			{
				myState = itemState.taken;
			}
			// Play pickup sound
			audio_play_sound(snd_itemPickup,1,0);
		}
	}
		
	// If not near an NPC or another item
	if (!nearbyItem && !nearbyNPC)
	{
		// Put down an item
		if (hasItem != noone)
		{
			myState = playerState.puttingDown;
			image_index = 0;
			global.playerControl = false;
			// Change state of item we were carrying
			with (hasItem)
			{
				putDownY = obj_player.y+5;
				myState = itemState.puttingBack;
			}
			// Play put-down sound
			audio_play_sound(snd_itemPutDown,1,0);
			// Reset item
			hasItem = noone;
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
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
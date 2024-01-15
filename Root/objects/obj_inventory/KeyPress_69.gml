/// @description Insert description here
// You can write your code in this editor

for(i = 0; i < ds_list_size(playerInventory); i++)
{
	var refID = playerInventory[| i];
	
	with (refID) {
			if(instance_exists(refID)){
				//retrievedItem = instance_find(obj_item, refID)
				retrievedItem = refID;
				show_debug_message( retrievedItem.amount);
				
				return;
			}
	}
//	if(ds_list_find_value(playerInventory, i) == newItemName)
//	{
//		
//	}
}





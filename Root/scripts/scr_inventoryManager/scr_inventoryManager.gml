// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function add_to_inventory(itemToAdd)
{
	ds_list_add(obj_inventory.playerInventory, itemToAdd);	
}

function remove_from_inventory(inventory, itemToRemove)
{
	
	for(i = 0; i < ds_list_size(playerInventory); i++)
	{
	var refID = playerInventory[| i];
	
	with (refID) 
	{
		
		
			if(instance_exists(refID))
			{
				//retrievedItem = instance_find(obj_item, refID)
				retrievedItem = refID;
				show_debug_message(retrievedItem.itemName)
				if(retrievedItem.amount == 1)
				{
					ds_list_delete(inventory, ds_list_find_index(inventory, retrievedItem));
					return;
				}
				retrievedItem.amount -= 1;
				//show_debug_message( "delete" + retrievedItem.amount);
				return;
			}
			
		
		}	
	}
}
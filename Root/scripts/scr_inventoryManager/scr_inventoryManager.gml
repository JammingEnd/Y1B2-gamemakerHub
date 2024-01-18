// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function add_to_inventory(itemToAdd)
{
	if(ds_list_size(global.playerInventory) > 0) 
	{
		for(i = 0; i < ds_list_size(global.playerInventory); i++)
		{
			var refID = global.playerInventory[| i];
			show_debug_message(refID.itemName);
			if(refID.itemName == itemToAdd) {
				with (refID) {
					if(instance_exists(refID))
					{
					//retrievedItem = instance_find(obj_item, refID)
						retrievedItem = refID;
					
						retrievedItem.amount += 1;
						return;
					}
				}
			}
			
		}
	}
	var newItem = instance_create_layer(999,999, "Instances", obj_item);
	//newItem.data[0, inv.name] = itemToAdd;
	//newItem.data[0, inv.amount] = 1;

	newItem.itemName = itemToAdd;
	newItem.amount = 1;
	ds_list_add(global.playerInventory, newItem);	
}

function ExistInInventory(itemToCompare)
{
	if(ds_list_size(global.playerInventory) > 0) 
	{
		for(i = 0; i < ds_list_size(global.playerInventory); i++)
		{
			var refID = global.playerInventory[| i];
			if(refID.itemName == itemToCompare) {
				with (refID) {
					if(instance_exists(refID))
					{
						return true;
					}
				}
			}
		}	
	}
	return false;
}




function remove_from_inventory(itemToRemove)
{
	var inv = global.playerInventory
	for(i = 0; i < ds_list_size(inv); i++)
	{
	var refID = inv[| i];
	
	with (refID) 
	{
		
		
			if(instance_exists(refID))
			{
				//retrievedItem = instance_find(obj_item, refID)
				retrievedItem = refID;
				show_debug_message(retrievedItem.itemName)
				if(retrievedItem.amount == 1)
				{
					ds_list_delete(inv, ds_list_find_index(inv, retrievedItem));
					return;
				}
				retrievedItem.amount -= 1;
				//show_debug_message( "delete" + retrievedItem.amount);
				return;
			}
			
		
		}	
	}
}

function ExchangeXPForItem(XPAmount, ItemInReturn) 
{
	global.DuckCount -= XPAmount;
	add_to_inventory(ItemInReturn);
}
function ExchangeRecoursesForItem(ReturnItem, ReqItemNames, ReqItemAmount) 
{
	show_debug_message(global.whatCurrentPotion)
	var canExhange = true;
	for(i = 0; i < ds_list_size(ReqItemAmount); i++)
	{
		
		if(ds_list_find_index(global.playerInventory, ReqItemNames[| i]))
		{
			show_debug_message("req Amount" + ReqItemAmount[| i]);
			show_debug_message("has amount" + ds_list_find_value(global.playerInventory, ds_list_find_index(global.playerInventory, ReqItemNames[| i])))
			if(ds_list_find_value(global.playerInventory, ds_list_find_index(global.playerInventory, ReqItemNames[| i])) >= ReqItemAmount[| i])
			{
				canExhange = false;
			}
		}
	}
	if(canExhange == true)
	{
		add_to_inventory(ReturnItem);	
	}
}
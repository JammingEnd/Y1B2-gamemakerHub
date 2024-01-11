/// @description Insert description here
// You can write your code in this editor







// Inherit the parent event
var newItemName = "Cool_Spell";

for(i = 0; i < ds_list_size(playerInventory); i++)
{
	var refID = playerInventory[| i];
	
	with (refID) {
			if(instance_exists(refID)){
				//retrievedItem = instance_find(obj_item, refID)
				retrievedItem = refID;
				retrievedItem.amount += 1;
				show_debug_message( retrievedItem.amount);
				return;
			}
	}
//	if(ds_list_find_value(playerInventory, i) == newItemName)
//	{
//		
//	}
}



var newItem = instance_create_layer(999,999, "Instances", obj_item);
newItem.data[0, inv.name] = newItemName;
newItem.data[0, inv.amount] = 1;

newItem.itemName = newItemName;
newItem.amount = 1;
add_to_inventory(newItem);

show_debug_message(ds_list_size(playerInventory));

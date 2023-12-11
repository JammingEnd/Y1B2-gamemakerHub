// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function add_to_inventory(itemToAdd)
{
	ds_list_add(obj_inventory.playerInventory, itemToAdd);	
}
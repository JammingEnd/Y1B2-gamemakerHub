/// @description Insert description here
// You can write your code in this editor

var newItem = instance_create_layer(999,999, "Instances", obj_item);
newItem.item_name = "Cool_Spell";
add_to_inventory(newItem);

show_debug_message(ds_list_size(playerInventory));


